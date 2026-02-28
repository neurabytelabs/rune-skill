# RUNE — Prompt Amplification Framework

## Description

Wraps any prompt in RUNE's **8-layer semantic engine** for dramatically better AI responses.

RUNE transforms flat, ambiguous prompts into structured XML prompts validated by Spinoza's philosophical framework — resulting in outputs that are ~45% higher quality than raw prompting.

### The 8 Layers

| Layer | Name | Purpose |
|-------|------|---------|
| L0 | System Core | Role, persona, behavioral rules |
| L1 | Context Identity | Domain knowledge, target audience |
| L2 | Intent Scope | Task definition, output format |
| L3 | Governance | Constraints, ethical boundaries |
| L4 | Cognitive Engine | Thinking strategy (CoT, ToT) |
| L5 | Capabilities Domain | Tools, integrations, capabilities |
| L6 | QA | Validation criteria, quality control |
| L7 | Output Meta | Format, style, length, language |

## Requirements

- Python 3.11+
- RUNE repo at `/Users/mustafa/Documents/GitHub/rune` (or set `RUNE_DIR`)
- `RUNE_API_KEY` env var (set in `~/.secrets` via `XAI_API_KEY`)
- `requests` Python library (`pip install requests`)

## Usage

```bash
# Pipe a prompt
echo "Write a blog post about AI" | bash main.sh

# Pass as argument
bash main.sh "Explain quantum entanglement to a 12-year-old"

# Use a specific RUNE template
RUNE_DIR=/path/to/rune bash main.sh "Analyze this dataset"

# Interactive mode
bash main.sh
```

## Example

**Input:**
```
Write a blog post about AI
```

**Output:**
```xml
<RUNE version="v4.3" domain="WRITING" complexity="L2" active="L0,L1,L2,L3,L6,L7">
  <L0>
    You are an expert tech blogger with 10+ years experience writing engaging,
    accessible articles on emerging technologies...
  </L0>
  <L1>
    Domain: Artificial Intelligence – history, current state, applications...
  </L1>
  <L2>
    Task: Write a complete blog post titled "The Rise of AI: Transforming Our
    World in 2024". Cover introduction, examples, benefits/challenges...
  </L2>
  <L3>
    Constraints: 800-1200 words; accurate info only; inclusive language...
  </L3>
  <L6>
    Validation: Original, error-free grammar, SEO-optimized (keywords: AI,
    machine learning)...
  </L6>
  <L7>
    Format: HTML-ready Markdown with H1 title, H2/H3 subheads...
  </L7>
</RUNE>
```

## Integration with OpenClaw

Use RUNE to pre-process any prompt before sending to Claude or another LLM:

```bash
ENHANCED=$(echo "Explain LLMs" | bash ~/Developer/neurabytelabs/rune-skill/main.sh)
# Then pass $ENHANCED to your preferred AI
```

## Source

- **RUNE repo:** `/Users/mustafa/Documents/GitHub/rune`
- **WAND CLI:** `wand.py` — `inscribe` command extracts enhanced prompt only
- **Version:** RUNE v4.3 / WAND v1.5.0
- **Author:** NeuraByte Labs
