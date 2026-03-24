---
name: rune-prompt-amplification
description: "RUNE v2.0 Deus Sive Natura — 8-layer prompt amplification with Spinoza Validator, 40+ grimoire templates, and multi-agent swarm mode. Transforms flat prompts into structured, high-quality AI instructions."
version: "2.0.0"
author: "Mustafa Saraç <mustafa@neurabytelabs.com>"
license: MIT
homepage: https://github.com/neurabytelabs/rune-skill
compatibility: Requires Python 3.11+, RUNE repo cloned locally, RUNE_API_KEY in ~/.secrets
---

# RUNE — Prompt Amplification Framework v2.0

RUNE transforms flat, ambiguous prompts into structured prompts validated by Spinoza's philosophical framework — resulting in dramatically better AI responses.

## What's New in v2.0 (Deus Sive Natura)

- **Spinoza Validator** — 4-pillar quality control (Conatus, Ratio, Laetitia, Natura)
- **40+ Grimoire Templates** — coding, writing, analysis, creative, AI/ML domains
- **Swarm Mode** — multi-agent prompt evolution and tournament
- **Oracle** — self-improving prompts with feedback loops
- **Lineage Tracking** — prompt ancestry and evolution history
- **14 CLI Commands** — cast, inscribe, duel, grimoire, validate, forge, swarm, etc.
- **Prompt Repetition** — based on Google Research arXiv:2512.14982

## The 8 Layers

| Layer | Name | Purpose |
|-------|------|---------|
| L0 | System Core | Role, persona, behavioral rules |
| L1 | Context Identity | Domain knowledge, target audience |
| L2 | Intent Scope | Task definition, output format |
| L3 | Governance | Constraints, ethical boundaries |
| L4 | Cognitive Engine | Thinking strategy (CoT, ToT) |
| L5 | Capabilities Domain | Tools, integrations, capabilities |
| L6 | QA | Spinoza Validator quality control |
| L7 | Output Meta | Format, style, length, language |

## Requirements

- Python 3.11+
- RUNE repo cloned locally (`git clone https://github.com/neurabytelabs/rune`)
- `RUNE_API_KEY` in `~/.secrets`

## Usage

```bash
# Default: inscribe (enhance prompt only)
echo "Write a blog post about AI" | bash main.sh

# Pass as argument
bash main.sh "Explain quantum entanglement to a 12-year-old"

# Specific command
bash main.sh cast "Design a REST API for a todo app"
bash main.sh validate "My existing prompt text"
bash main.sh grimoire
bash main.sh duel "Compare sorting algorithms"
```

## Setup

```bash
# 1. Clone RUNE repo
git clone https://github.com/neurabytelabs/rune ~/Documents/GitHub/rune

# 2. Install dependencies
cd ~/Documents/GitHub/rune && pip install -r requirements.txt

# 3. Add API key
echo "export RUNE_API_KEY=your_key" >> ~/.secrets

# 4. Set RUNE_DIR (optional, defaults to ~/Documents/GitHub/rune)
export RUNE_DIR=~/Documents/GitHub/rune

# 5. Test
echo "Hello" | bash main.sh
```

## Source

- **Author:** NeuraByte Labs
- **Version:** RUNE v2.0 / WAND CLI
- **Repo:** https://github.com/neurabytelabs/rune-skill
- **Framework:** https://github.com/neurabytelabs/rune
