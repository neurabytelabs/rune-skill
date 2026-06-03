# 🪄 RUNE — Prompt Amplification Skill for Hermes

> *"Every prompt is a spell. Every spell, a decree of understanding."*

RUNE transforms flat, ambiguous prompts into structured 8-layer instructions validated by Spinoza's philosophical framework. This repository packages RUNE as a **Hermes-first skill** plus a small shell wrapper for standalone WAND CLI workflows.

**v2.0 "Deus Sive Natura"** — Spinoza Validator, 40+ grimoire templates, multi-agent swarm mode, Oracle feedback loops, and prompt lineage tracking.

## What It Does

```text
Input:  "Write a blog post about AI"

RUNE applies 8 layers:
  L0 → Expert role / persona
  L1 → Domain context and target audience
  L2 → Task definition and success criteria
  L3 → Constraints, ethics, permission boundaries
  L4 → Reasoning strategy
  L5 → Tool and capability selection
  L6 → Spinoza QA validation
  L7 → Output format, style, length, language

Output: Structured, high-quality prompt or Hermes operating guidance
```

Inside Hermes, the skill usually runs silently: it improves planning, coding, writing, analysis, and agent prompts without forcing the user to read the whole layer stack. If the user asks for visible RUNE mode, show the layers compactly.

## The 8 Layers

| Layer | Name | Purpose |
|-------|------|---------|
| L0 | System Core | Role, persona, behavioral rules |
| L1 | Context Identity | Domain knowledge, history, target audience |
| L2 | Intent Scope | Task definition, success criteria, output format |
| L3 | Governance | Constraints, ethics, boundaries, non-goals |
| L4 | Cognitive Engine | Reasoning strategy: decomposition, RCA, ToT, critique |
| L5 | Capabilities Domain | Tools, integrations, files, agents, retrieval |
| L6 | QA | Spinoza Validator — quality control |
| L7 | Output Meta | Format, style, length, language |

## v2.0 Features

- **Spinoza Validator** — Conatus (agency), Ratio (logic), Laetitia (clarity), Natura (flow)
- **40+ Grimoire Templates** — coding, writing, analysis, creative, AI/ML
- **WAND CLI** — `cast`, `inscribe`, `duel`, `grimoire`, `validate`, `forge`, `swarm`, `lineage`, and more
- **Swarm Mode** — multi-agent prompt evolution with tournament selection
- **Oracle Engine** — self-improving prompts with feedback loops
- **Prompt Lineage** — ancestry and evolution history

## Install for Hermes

From this repository:

```bash
mkdir -p ~/.hermes/skills/prompt-engineering/rune-prompt-amplification
cp SKILL.md ~/.hermes/skills/prompt-engineering/rune-prompt-amplification/SKILL.md
```

Start a fresh Hermes session and load the skill:

```bash
hermes chat -s prompt-engineering/rune-prompt-amplification -q "RUNE this into a launch plan: ship a private beta for my agent mesh"
```

> Note: the current Hermes session may not see a newly copied skill until a new session starts.

## Requirements

For Hermes skill loading:

- Hermes Agent installed
- `SKILL.md` copied into `~/.hermes/skills/...`

For the optional WAND CLI wrapper:

- Python 3.11+
- RUNE repo cloned locally or `wand` installed
- Provider configured through `~/.rune/config.toml` or environment variables

## Setup WAND CLI

### Option A — local source install

```bash
git clone https://github.com/neurabytelabs/rune ~/Documents/GitHub/rune
cd ~/Documents/GitHub/rune
python3 -m pip install -e .
```

### Option B — package install when available

```bash
python3 -m pip install rune-wand
```

### Provider config

RUNE uses an OpenAI-compatible endpoint. Do not commit real keys.

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
```

`main.sh` still sources `~/.secrets` when present for backwards compatibility, but new setups should prefer explicit env vars or `~/.rune/config.toml`.

## Usage

```bash
# Enhance a prompt; default command is inscribe
echo "Explain quantum computing" | bash main.sh
bash main.sh "Write a marketing email for my SaaS"

# Specific WAND commands
bash main.sh cast "Design a REST API for a todo app"
bash main.sh validate "Check this prompt quality"
bash main.sh duel "Compare sorting algorithms"
bash main.sh grimoire
bash main.sh version
bash main.sh swarm "Evolve the best coding prompt"

# Pipe enhanced prompt into another CLI
ENHANCED=$(echo "Analyze this code" | bash main.sh)
echo "$ENHANCED" | llm -m claude-3.5-sonnet
```

## Research Workspaces

- `research/vc-ai-startup-scout-skill/` — David × Mustafa RUNE lab for shaping a reusable AI/VC market-intelligence skill from Voicenotes, Gemini 3.5 Flash validation, NotebookLM podcast rehearsal, optional guarded MiroFish synthetic preflight, and an English David-facing `dashboard.html` decision surface for the future private proof-of-concept repo.

## Legacy OpenClaw Compatibility

This repository used to be positioned as **RUNE — Prompt Amplification Skill for OpenClaw** and still keeps `main.sh` compatible with executable-skill style workflows where practical.

The primary target is now Hermes:

- Hermes loads `SKILL.md` as durable agent context.
- `main.sh` remains a terminal wrapper around WAND.
- OpenClaw references should be treated as legacy compatibility, not the canonical install path.

## Why RUNE?

Most people give AI flat prompts and get mediocre output. RUNE applies prompt architecture automatically: role, context, intent, constraints, reasoning mode, capabilities, QA, and output shape.

Built on Spinoza's conatus frame by NeuraByte Labs: increase clarity, preserve agency, and turn vague intent into usable structure.

> *"The more an action follows from the nature of the understanding agent, the more perfect it is."*
> — Baruch Spinoza, Ethics IV

## Author

[Mustafa Saraç](https://mustafasarac.com) · [NeuraByte Labs](https://neurabytelabs.com)

## Related

- **RUNE Framework** → [github.com/neurabytelabs/rune](https://github.com/neurabytelabs/rune) — Core engine and WAND CLI
- **RUNE Playground** → [github.com/neurabytelabs/rune-playground](https://github.com/neurabytelabs/rune-playground) — Browser demo
- **Hermes Agent** → [hermes-agent.nousresearch.com](https://hermes-agent.nousresearch.com/docs/) — Agent runtime and skill system

## License

MIT
