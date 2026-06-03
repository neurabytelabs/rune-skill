#!/usr/bin/env bash
# ╔══════════════════════════════════════════════════════╗
# ║  RUNE Skill v2.0 — Prompt Amplification via WAND    ║
# ║  NeuraByte Labs | Hermes Skill / CLI Wrapper        ║
# ╚══════════════════════════════════════════════════════╝
#
# Usage:
#   echo "Write a blog post about AI" | bash main.sh
#   bash main.sh "Write a blog post about AI"
#   bash main.sh cast "Design a REST API"
#   bash main.sh validate "My prompt"
#   bash main.sh grimoire
#   bash main.sh version
#   bash main.sh                  # prompts interactively

set -euo pipefail

RUNE_DIR="${RUNE_DIR:-$HOME/Documents/GitHub/rune}"

# ── Load legacy local secrets if present ──────────────────
# Prefer ~/.rune/config.toml or explicit env vars for new setups.
if [[ -f "$HOME/.secrets" ]]; then
  # shellcheck disable=SC1091
  source "$HOME/.secrets"
fi

# ── Keep wrapper output clean on system Python builds ──────
# macOS Python 3.9 + urllib3 v2 may emit a benign LibreSSL warning before
# every command; suppress only that known warning so prompt piping stays clean.
export PYTHONWARNINGS="${PYTHONWARNINGS:+$PYTHONWARNINGS,}ignore:urllib3 v2 only supports OpenSSL"

# ── Resolve WAND command ──────────────────────────────────
if command -v wand >/dev/null 2>&1; then
  WAND_CMD=(wand)
elif [[ -f "$RUNE_DIR/wand.py" ]]; then
  WAND_CMD=(python3 "$RUNE_DIR/wand.py")
else
  echo "ERROR: WAND CLI not found." >&2
  echo "Install RUNE with: python3 -m pip install rune-wand" >&2
  echo "Or clone it: git clone https://github.com/neurabytelabs/rune $RUNE_DIR" >&2
  echo "Or set RUNE_DIR to your local RUNE repo path." >&2
  exit 1
fi

# ── Determine command and arguments ───────────────────────
KNOWN_COMMANDS="cast inscribe duel grimoire test validate forge stats cost config fuse bind lineage swarm version"
NO_PROMPT_COMMANDS="grimoire stats cost config version forge lineage"
COMMAND="inscribe"
ARGS=()

if [[ $# -ge 1 ]]; then
  if echo "$KNOWN_COMMANDS" | grep -qw -- "$1"; then
    COMMAND="$1"
    shift
    ARGS=("$@")
  else
    ARGS=("$*")
  fi
elif ! [ -t 0 ]; then
  ARGS=("$(cat)")
else
  echo "Enter prompt (Ctrl+D when done):" >&2
  ARGS=("$(cat)")
fi

# ── Read stdin for prompt-oriented commands with no args ───
if ! echo "$NO_PROMPT_COMMANDS" | grep -qw -- "$COMMAND"; then
  if [[ ${#ARGS[@]} -eq 0 ]]; then
    if ! [ -t 0 ]; then
      ARGS=("$(cat)")
    fi
  fi

  if [[ ${#ARGS[@]} -eq 0 || -z "${ARGS[*]}" ]]; then
    echo "ERROR: No prompt or command arguments provided." >&2
    exit 1
  fi
fi

# ── Invoke RUNE WAND ──────────────────────────────────────
# --no-color must be a global option before the subcommand.
# Strip ANSI colors anyway for clean piping across agent runtimes.
# macOS ships an older Bash where expanding an empty array under `set -u`
# can raise "unbound variable", so keep the no-arg path explicit.
if [[ ${#ARGS[@]} -gt 0 ]]; then
  "${WAND_CMD[@]}" --no-color "$COMMAND" "${ARGS[@]}" \
    | sed $'s/\033\[[0-9;]*m//g'
else
  "${WAND_CMD[@]}" --no-color "$COMMAND" \
    | sed $'s/\033\[[0-9;]*m//g'
fi
