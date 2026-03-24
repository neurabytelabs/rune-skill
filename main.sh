#!/usr/bin/env bash
# ╔══════════════════════════════════════════════════════╗
# ║  RUNE Skill v2.0 — Prompt Amplification via WAND    ║
# ║  NeuraByte Labs | OpenClaw Skill                     ║
# ╚══════════════════════════════════════════════════════╝
#
# Usage:
#   echo "Write a blog post about AI" | bash main.sh
#   bash main.sh "Write a blog post about AI"
#   bash main.sh cast "Design a REST API"
#   bash main.sh validate "My prompt"
#   bash main.sh grimoire
#   bash main.sh                  # prompts interactively

set -euo pipefail

RUNE_DIR="${RUNE_DIR:-$HOME/Documents/GitHub/rune}"
WAND="$RUNE_DIR/wand.py"

# ── Load secrets for API key ──────────────────────────────
if [[ -f "$HOME/.secrets" ]]; then
  # shellcheck disable=SC1091
  source "$HOME/.secrets"
fi

# ── Validate wand.py ──────────────────────────────────────
if [[ ! -f "$WAND" ]]; then
  echo "ERROR: wand.py not found at $WAND" >&2
  echo "Clone RUNE: git clone https://github.com/neurabytelabs/rune $RUNE_DIR" >&2
  echo "Or set RUNE_DIR env var to your RUNE repo path." >&2
  exit 1
fi

# ── Validate RUNE_API_KEY ─────────────────────────────────
if [[ -z "${RUNE_API_KEY:-}" ]]; then
  echo "ERROR: RUNE_API_KEY is not set." >&2
  echo "Add it to ~/.secrets or export RUNE_API_KEY=your_key" >&2
  exit 1
fi

# ── Determine command and prompt ──────────────────────────
KNOWN_COMMANDS="cast inscribe duel grimoire test validate forge stats cost config fuse lineage swarm version"
COMMAND="inscribe"
PROMPT=""

if [[ $# -ge 1 ]]; then
  # Check if first arg is a known wand command
  if echo "$KNOWN_COMMANDS" | grep -qw "$1"; then
    COMMAND="$1"
    shift
    PROMPT="$*"
  else
    PROMPT="$*"
  fi
elif ! [ -t 0 ]; then
  # stdin has data (pipe or redirect)
  PROMPT="$(cat)"
else
  echo "Enter prompt (Ctrl+D when done):" >&2
  PROMPT="$(cat)"
fi

# ── Commands that don't need a prompt ─────────────────────
NO_PROMPT_COMMANDS="grimoire stats cost config version"
if echo "$NO_PROMPT_COMMANDS" | grep -qw "$COMMAND"; then
  cd "$RUNE_DIR"
  python3 "$WAND" "$COMMAND" 2>&1 | sed $'s/\033\[[0-9;]*m//g'
  exit 0
fi

if [[ -z "$PROMPT" ]]; then
  echo "ERROR: No prompt provided." >&2
  exit 1
fi

# ── Invoke RUNE wand ──────────────────────────────────────
cd "$RUNE_DIR"

# Strip ANSI colors from output for clean piping
python3 "$WAND" "$COMMAND" "$PROMPT" \
  | sed $'s/\033\[[0-9;]*m//g'
