# 🪄 RUNE — Prompt Amplification for Hermes

> Every prompt is a spell. RUNE makes the spell explicit enough to survive contact with reality.

RUNE is a prompt-amplification skill for **Hermes Agent**. It turns rough intent into structured operating guidance using an 8-layer prompt architecture and a Spinoza-style quality check.

This repo contains:

- `SKILL.md` — the canonical Hermes skill.
- `main.sh` — an optional WAND/RUNE CLI wrapper for terminal workflows.
- `package.json` — package and Hermes metadata.

OpenClaw support is kept only as **legacy compatibility**. The primary runtime is Hermes.

---

## What RUNE Does

RUNE improves prompts and agent instructions by making the hidden structure visible:

```text
Input:
  "Build me a launch plan for my agent mesh."

RUNE expands the request through:
  L0  System Core        role, stance, behavioral rules
  L1  Context Identity   domain, history, audience, constraints
  L2  Intent Scope       goal, success criteria, output shape
  L3  Governance         safety, ethics, permissions, non-goals
  L4  Cognitive Engine   reasoning strategy, decomposition, critique
  L5  Capabilities       tools, files, integrations, agents, retrieval
  L6  QA                 Spinoza validator
  L7  Output Meta        language, tone, structure, delivery format

Output:
  A clearer prompt, plan, brief, or Hermes operating pattern.
```

Inside Hermes, RUNE should usually run **silently**: it strengthens complex planning, writing, coding, debugging, and agent-design tasks without forcing the user to read every layer. If the user asks for visible RUNE mode, show the compact layer breakdown.

---

## When to Use It

Use RUNE for:

- prompt amplification and prompt repair;
- implementation plans and architecture briefs;
- debugging and root-cause analysis prompts;
- code-review briefs and subagent instructions;
- cron prompts, mesh coordination, and autonomous-agent task design;
- strategic writing, product narratives, and research synthesis.

Do **not** overuse it for:

- greetings;
- one-line factual answers;
- simple terminal or file operations;
- cases where the user explicitly wants raw output.

RUNE is a clarity amplifier, not ceremonial fog. Fog already has enough market share.

---

## Install for Hermes

From this repository:

```bash
mkdir -p ~/.hermes/skills/prompt-engineering/rune-prompt-amplification
cp SKILL.md ~/.hermes/skills/prompt-engineering/rune-prompt-amplification/SKILL.md
```

Start a fresh Hermes session and load the skill:

```bash
hermes chat -s prompt-engineering/rune-prompt-amplification \
  -q "RUNE this into a launch plan: ship a private beta for my agent mesh"
```

Notes:

- New skills may require a fresh Hermes session before they appear.
- Use the full categorized path `prompt-engineering/rune-prompt-amplification` to avoid name collisions with other RUNE-related skills.

---

## Optional WAND CLI Setup

Hermes only needs `SKILL.md`. The CLI wrapper needs either the local RUNE source tree or an installed `wand` command.

### Option A — local source

```bash
git clone https://github.com/neurabytelabs/rune ~/Documents/GitHub/rune
cd ~/Documents/GitHub/rune
python3 -m pip install -e .
```

### Option B — package install, when available

```bash
python3 -m pip install rune-wand
```

### Provider configuration

RUNE reads provider settings from environment variables and/or `~/.rune/config.toml`.

Never commit real keys.

```bash
mkdir -p ~/.rune
cat > ~/.rune/config.toml <<'EOF'
[llm]
api_url = "https://your-openai-compatible-endpoint/v1/chat/completions"
api_key = "your-api-key"
default_model = "your-model"
timeout = 300
EOF
```

Environment variables also work:

```bash
export RUNE_API_URL="https://your-openai-compatible-endpoint/v1/chat/completions"
export RUNE_API_KEY="your-api-key"
export RUNE_DIR="$HOME/Documents/GitHub/rune"
```

`main.sh` still sources `~/.secrets` when present for backwards compatibility, but new setups should prefer explicit environment variables or `~/.rune/config.toml`.

---

## CLI Usage

```bash
# Default command: inscribe / enhance prompt only
echo "Explain quantum computing" | bash main.sh
bash main.sh "Write a marketing email for my SaaS"

# Explicit WAND commands
bash main.sh cast "Design a REST API for a todo app"
bash main.sh validate "Check this prompt quality"
bash main.sh duel "Compare sorting algorithms"
bash main.sh grimoire
bash main.sh version
bash main.sh swarm "Evolve the best coding prompt"

# Pipe an enhanced prompt into another CLI
ENHANCED=$(echo "Analyze this code" | bash main.sh)
echo "$ENHANCED" | llm -m claude-3.5-sonnet
```

---

## RUNE Patterns for Hermes

### Planning

```text
Apply RUNE internally. Produce a concrete plan with assumptions, ordered steps, likely files, validation, risks, and open questions. Do not implement yet.
```

### Coding

```text
Apply RUNE for architecture-first implementation. Inspect before editing, preserve user changes, implement in controlled steps, run tests, and report real tool output.
```

### Debugging

```text
Apply RUNE with systematic root-cause analysis. Reproduce, isolate, hypothesize, test, fix narrowly, and verify the actual failure path is gone.
```

### Agent / Cron Prompt Design

```text
Apply RUNE to make this autonomous prompt self-contained: role, context, trigger, permissions, tools, stop conditions, output format, and failure reporting.
```

---

## Spinoza Validator

Before final output, check:

- **Conatus** — Does this increase the user's ability to act?
- **Ratio** — Is it coherent, grounded, and internally consistent?
- **Laetitia** — Is it clarifying rather than muddy?
- **Natura** — Does it feel natural and usable, not overengineered?

If one fails, revise before answering.

---

## Verification

After changing this repo, run:

```bash
bash -n main.sh
bash main.sh version
bash main.sh grimoire
bash main.sh validate "Test prompt quality"
```

For Hermes live loading:

```bash
hermes chat -s prompt-engineering/rune-prompt-amplification \
  -q "Sadece şu metni döndür: RUNE live check OK"
```

Expected result: Hermes loads the skill and returns the requested check text.

---

## Repo Hygiene

Keep this repo focused on the reusable skill package.

Do not commit:

- local Hermes workspace state such as `.hermes/`;
- temporary research folders;
- generated outputs, logs, caches, or local credentials;
- real API keys from `~/.secrets`, `~/.rune/config.toml`, `.env`, or Hermes config files.

If research becomes durable product knowledge, move it into its own repo or a deliberate `docs/` path before linking it from this README.

---

## Legacy OpenClaw Compatibility

This repository was originally positioned as **RUNE — Prompt Amplification Skill for OpenClaw**. `main.sh` remains compatible with executable-skill style workflows where practical.

The canonical path is now:

1. Hermes loads `SKILL.md` as skill context.
2. `main.sh` remains an optional WAND CLI bridge.
3. OpenClaw references stay legacy, not the center of gravity.

---

## Related

- **RUNE Framework** — https://github.com/neurabytelabs/rune
- **RUNE Playground** — https://github.com/neurabytelabs/rune-playground
- **Hermes Agent Docs** — https://hermes-agent.nousresearch.com/docs/

---

## Author

[Mustafa Saraç](https://mustafasarac.com) · [NeuraByte Labs](https://neurabytelabs.com)

## License

MIT
