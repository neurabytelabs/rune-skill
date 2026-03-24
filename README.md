# 🪄 RUNE — Prompt Amplification Skill for OpenClaw

> *"Every prompt is a spell. Every spell, a decree of understanding."*

RUNE transforms flat, ambiguous prompts into structured 8-layer prompts validated by Spinoza's philosophical framework — resulting in dramatically better AI responses.

**v2.0 "Deus Sive Natura"** — now with Spinoza Validator, 40+ grimoire templates, multi-agent swarm mode, and prompt lineage tracking.

## What It Does

```
Input:  "Write a blog post about AI"

RUNE applies 8 layers:
  L0 → Expert tech blogger persona
  L1 → Domain context, target audience
  L2 → Task definition, format spec
  L3 → Constraints, ethics check
  L4 → CoT thinking strategy
  L5 → Tool selection
  L6 → Spinoza QA validation
  L7 → Output format, style, length

Output: Structured, high-quality prompt ready for any LLM
```

## The 8 Layers

| Layer | Name | Purpose |
|-------|------|---------|
| L0 | System Core | Role, persona, behavioral rules |
| L1 | Context Identity | Domain knowledge, target audience |
| L2 | Intent Scope | Task definition, output format |
| L3 | Governance | Constraints, ethical boundaries |
| L4 | Cognitive Engine | Thinking strategy (CoT, ToT) |
| L5 | Capabilities Domain | Tools, integrations, capabilities |
| L6 | QA | Spinoza Validator — 4-pillar quality control |
| L7 | Output Meta | Format, style, length, language |

## v2.0 Features

- **Spinoza Validator** — Conatus (agency), Ratio (logic), Laetitia (tone), Natura (flow)
- **40+ Grimoire Templates** — coding, writing, analysis, creative, AI/ML
- **14 CLI Commands** — cast, inscribe, duel, grimoire, validate, forge, swarm, lineage...
- **Swarm Mode** — multi-agent prompt evolution with tournament selection
- **Oracle Engine** — self-improving prompts with feedback loops
- **Prompt Repetition** — based on Google Research (arXiv:2512.14982)

## Install

```bash
npx clawhub@latest install neurabytelabs/rune-skill
```

## Requirements

- Python 3.11+
- RUNE repo cloned locally
- `RUNE_API_KEY` in `~/.secrets`

## Setup

```bash
# 1. Clone RUNE repo
git clone https://github.com/neurabytelabs/rune ~/Documents/GitHub/rune

# 2. Install dependencies
cd ~/Documents/GitHub/rune && pip install -r requirements.txt

# 3. Add API key
echo "export RUNE_API_KEY=your_key" >> ~/.secrets
```

## Usage

```bash
# Enhance a prompt (default: inscribe)
echo "Explain quantum computing" | bash main.sh

# As argument
bash main.sh "Write a marketing email for my SaaS"

# Specific commands
bash main.sh cast "Design a REST API for a todo app"
bash main.sh validate "Check this prompt quality"
bash main.sh duel "Compare sorting algorithms"
bash main.sh grimoire
bash main.sh swarm "Evolve the best coding prompt"

# Pipe enhanced prompt into your AI
ENHANCED=$(echo "Analyze this code" | bash main.sh)
echo "$ENHANCED" | llm -m claude-3.5-sonnet
```

## Why RUNE?

Most people give AI a flat prompt and get mediocre output. RUNE applies prompt engineering best practices automatically — in under 2 seconds.

Built on Spinoza's philosophical framework by NeuraByte Labs.

> *"The more an action follows from the nature of the understanding agent, the more perfect it is."*
> — Baruch Spinoza, Ethics IV

## Author

[Mustafa Saraç](https://mustafasarac.com) · [NeuraByte Labs](https://neurabytelabs.com)

## Related

- **RUNE Framework** → [github.com/neurabytelabs/rune](https://github.com/neurabytelabs/rune) — Core engine, full docs
- **RUNE Playground** → [github.com/neurabytelabs/rune-playground](https://github.com/neurabytelabs/rune-playground) — Browser demo

## License

MIT
