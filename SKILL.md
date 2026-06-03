---
name: rune-prompt-amplification
description: Use when a Hermes session should apply Mustafa Saraç's RUNE prompt-amplification framework to planning, coding, writing, analysis, strategy, or prompt-design tasks. Converts rough intent into structured 8-layer instructions with Spinoza-style QA while keeping simple requests lightweight.
version: "2.0.0"
author: "Mustafa Saraç <mustafa@neurabytelabs.com>"
license: MIT
homepage: https://github.com/neurabytelabs/rune-skill
platforms: [macos, linux]
metadata:
  hermes:
    tags: [rune, hermes, prompt-engineering, prompt-amplification, spinoza, wand]
    related_skills: [rune-framework]
---

# RUNE — Prompt Amplification for Hermes

## Overview

RUNE turns flat, ambiguous requests into structured AI instructions. In Hermes, this skill is primarily an **operating pattern**: load it when the agent should silently improve complex prompts, plans, reviews, and strategy work through the RUNE 8-layer architecture.

The repository also includes `main.sh`, a small shell wrapper around the local RUNE/WAND CLI for terminal workflows. Hermes does not require the wrapper to load this skill, but the wrapper is useful when you want a standalone amplified prompt from the shell.

## When to Use

Use this skill for:

- Prompt amplification: “RUNE this”, “improve this prompt”, “make this agent prompt stronger”.
- Planning: multi-step implementation plans, launch plans, decision frameworks.
- Coding and debugging: architecture-first prompts, root-cause analysis, code-review briefs.
- Writing and analysis: articles, executive summaries, product narratives, strategic synthesis.
- Agent design: Hermes prompts, cron prompts, subagent instructions, mesh coordination briefs.
- High-ambiguity tasks where clarifying questions or explicit constraints matter.

Do **not** force full RUNE ceremony for:

- Greetings.
- Tiny factual answers.
- One-step terminal/file operations.
- Cases where the user explicitly asks for a raw, unmodified answer.

## Hermes Operating Mode

Default behavior inside Hermes:

1. **Detect complexity.** If the request is simple, answer directly. If it is complex, activate RUNE internally.
2. **Amplify silently.** Do not dump all layers unless the user asks for “RUNE mode”, “show layers”, or a visible breakdown.
3. **Ask only useful questions.** If missing context materially changes the result, ask a short clarifying question. Otherwise proceed with explicit assumptions.
4. **Preserve execution discipline.** For build/run/verify tasks, RUNE improves the plan but does not replace real tool execution and validation.
5. **Report clearly.** Output should be shorter, sharper, and more actionable than the raw prompt would have produced.

When the user asks for visible RUNE, use a compact structure:

```markdown
## RUNE Pass
- L0 Role:
- L1 Context:
- L2 Intent:
- L3 Governance:
- L4 Cognitive Mode:
- L5 Capabilities:
- L6 QA:
- L7 Output:
```

## The 8 RUNE Layers

| Layer | Name | Purpose |
|---|---|---|
| L0 | System Core | Role, stance, behavioral rules |
| L1 | Context Identity | Domain, history, audience, constraints |
| L2 | Intent Scope | Actual goal, success criteria, output format |
| L3 | Governance | Safety, ethics, permissions, non-goals |
| L4 | Cognitive Engine | Reasoning strategy: decomposition, RCA, ToT, critique |
| L5 | Capabilities Domain | Tools, files, integrations, agents, retrieval |
| L6 | QA | Spinoza-style validation and correctness checks |
| L7 | Output Meta | Language, tone, structure, length, delivery format |

## Spinoza Validator

Before final output, check four qualities:

- **Conatus** — Does this increase the user’s agency and ability to act?
- **Ratio** — Is it coherent, grounded, and internally consistent?
- **Laetitia** — Is it constructive and clarifying rather than muddy?
- **Natura** — Does it feel natural, usable, and not overengineered?

If one fails, revise before answering.

## Setup for Local WAND CLI

Hermes can load this skill from `SKILL.md` alone. The CLI wrapper needs the core RUNE repository or the `wand` executable.

### Option A — use local RUNE source

```bash
git clone https://github.com/neurabytelabs/rune ~/Documents/GitHub/rune
cd ~/Documents/GitHub/rune
python3 -m pip install -e .
```

### Option B — use package install when available

```bash
python3 -m pip install rune-wand
```

### Configure provider

RUNE reads provider settings from environment variables and `~/.rune/config.toml`. Never commit real keys.

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

You may also export:

```bash
export RUNE_API_URL="https://your-openai-compatible-endpoint/v1/chat/completions"
export RUNE_API_KEY="your-api-key"
```

`main.sh` will also source `~/.secrets` if present for backwards compatibility, but new setups should prefer explicit environment variables or `~/.rune/config.toml`.

## Hermes Installation

From this repository:

```bash
mkdir -p ~/.hermes/skills/prompt-engineering/rune-prompt-amplification
cp SKILL.md ~/.hermes/skills/prompt-engineering/rune-prompt-amplification/SKILL.md
```

Then start a fresh Hermes session and load it:

```bash
hermes chat -s prompt-engineering/rune-prompt-amplification -q "RUNE this into a launch plan: ship a private beta for my agent mesh"
```

Current Hermes sessions may not see newly copied skills until a new session starts.

## CLI Wrapper Usage

```bash
# Default: inscribe / enhance prompt only
echo "Write a blog post about AI" | bash main.sh
bash main.sh "Explain quantum entanglement to a 12-year-old"

# Explicit WAND commands
bash main.sh cast "Design a REST API for a todo app"
bash main.sh validate "My existing prompt text"
bash main.sh grimoire
bash main.sh version
bash main.sh swarm "Evolve the best coding prompt"
```

The wrapper prefers an installed `wand` command when available, and falls back to `~/Documents/GitHub/rune/wand.py` or `$RUNE_DIR/wand.py`.

## RUNE Task Patterns

### Planning

Use:

```text
Apply RUNE internally. Produce a concrete plan with assumptions, ordered steps, likely files, validation, risks, and open questions. Do not implement yet.
```

### Coding

Use:

```text
Apply RUNE for architecture-first implementation. Inspect before editing, preserve user changes, implement in controlled steps, run tests, and report real tool output.
```

### Debugging

Use:

```text
Apply RUNE with systematic root-cause analysis. Reproduce, isolate, hypothesize, test, fix narrowly, and verify the actual failure path is gone.
```

### Agent / Cron Prompt Design

Use:

```text
Apply RUNE to make this autonomous prompt self-contained: role, context, trigger, permissions, tools, stop conditions, output format, and failure reporting.
```

## Governance and Safety

- Do not expose or copy secrets from `~/.secrets`, `~/.rune/config.toml`, `.env`, or Hermes config files.
- Ask before destructive actions, external sends, commits/pushes, or service lifecycle changes unless the current instruction clearly grants that scope.
- Keep OpenClaw references as legacy compatibility only; Hermes is the primary target for this skill.
- Treat RUNE as a clarity amplifier, not theatrical decoration. If the layer list makes the answer worse, keep it internal.

## Legacy OpenClaw Compatibility

Older installs may still use `main.sh` as an OpenClaw-style executable skill. Keep the wrapper compatible where practical, but do not shape the primary documentation around OpenClaw. The canonical integration path here is Hermes loading `SKILL.md`.

## Verification Checklist

After editing this repository:

- [ ] `SKILL.md` starts with YAML frontmatter and has `name` + `description`.
- [ ] Description is under 1024 characters.
- [ ] README says Hermes-first and keeps OpenClaw only as legacy.
- [ ] `package.json` has Hermes metadata.
- [ ] `bash -n main.sh` passes.
- [ ] `bash main.sh version` works without requiring an API key.
- [ ] `bash main.sh grimoire` works against the local RUNE repo or installed `wand`.
- [ ] Git diff is reviewed before commit/push.
