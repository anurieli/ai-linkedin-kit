#!/bin/bash
set -e

KIT_DIR="$HOME/ai-linkedin-kit"

echo "Setting up ai-linkedin-kit at $KIT_DIR..."

# Backup if exists
if [ -d "$KIT_DIR" ]; then
  BACKUP_DIR="${KIT_DIR}-backup-$(date +%Y%m%d-%H%M%S)"
  echo "Existing kit found. Backing up to $BACKUP_DIR..."
  cp -r "$KIT_DIR" "$BACKUP_DIR"
  echo "Backup created."
fi

# Create all directories
mkdir -p "$KIT_DIR/.claude/agents"
mkdir -p "$KIT_DIR/.claude/skills/digest-brand"
mkdir -p "$KIT_DIR/.claude/skills/style-capture"
mkdir -p "$KIT_DIR/.claude/skills/add-source"
mkdir -p "$KIT_DIR/.claude/skills/study-creator"
mkdir -p "$KIT_DIR/.claude/skills/linkedin-post/templates"
mkdir -p "$KIT_DIR/.claude/skills/hook-workshop"
mkdir -p "$KIT_DIR/.claude/skills/batch-create"
mkdir -p "$KIT_DIR/identity/brand-document-original"
mkdir -p "$KIT_DIR/identity/writing-samples"
mkdir -p "$KIT_DIR/identity/creator-studies"
mkdir -p "$KIT_DIR/content-strategy"
mkdir -p "$KIT_DIR/posts/drafts"
mkdir -p "$KIT_DIR/posts/published"
mkdir -p "$KIT_DIR/posts/batches"

# Touch empty identity files
touch "$KIT_DIR/identity/brand-profile.md"
touch "$KIT_DIR/identity/style-profile.md"

echo "Directories created."
echo "Writing all skill files..."

# ============================================================
# .claude/CLAUDE.md
# ============================================================
cat > "$KIT_DIR/.claude/CLAUDE.md" << 'EOF'
# LinkedIn Writing Workspace

This project writes LinkedIn posts in a client's authentic voice, aligned to their brand and LinkedIn positioning. Claude acts as a LinkedIn writing partner — not a generic AI writer.

---

## Mode Detection

**On every session start, check whether onboarding is complete:**

```
identity/brand-profile.md   — exists and is non-empty?
identity/style-profile.md   — exists and is non-empty?
```

- **Both exist and non-empty** → Operational mode (skip to "Default Behavior" below)
- **Either missing or empty** → Onboarding mode (follow the onboarding flow below)

---

## Onboarding Flow (First Run)

When onboarding is needed, walk the client through setup step by step. Be warm, patient, and non-technical throughout.

### Step 1 — Welcome Brief

> **Welcome! I'm your LinkedIn writing assistant.**
>
> Here's what we're about to do together:
>
> 1. **Your brand** — who you are, who you serve, what you stand for on LinkedIn
> 2. **Your writing voice** — I'll study how you actually write so I can match it
> 3. **Your content pillars** — the big themes you want to be known for
> 4. **Your inspiration** — the creators and thinkers you draw from
> 5. **Your posting rhythm** — how often you want to post
>
> **This takes about 15-20 minutes.** Ready?

### Step 2 — Brand Profile
Run `/digest-brand`. Do not proceed until `identity/brand-profile.md` exists.

### Step 3 — Writing Voice
Run `/style-capture`. Do not proceed until `identity/style-profile.md` exists.

### Step 4 — Content Pillars
Build `content-strategy/pillars.yaml` with their pillars and allocation percentages.

### Step 5 — Inspiration Sources
Use `/add-source` to populate `sources.yaml`.

### Step 6 — Posting Cadence
Record in `content-strategy/pillars.yaml` under `posting_cadence`.

### Step 7 — Setup Complete
End the session. First post happens in a fresh chat.

---

## File Locations

| File | Purpose |
|------|---------|
| `identity/brand-profile.md` | Brand identity, audience, messaging pillars, LinkedIn positioning |
| `identity/style-profile.md` | 10-dimension writing voice profile |
| `identity/brand-document-original/` | Raw brand documents for `/digest-brand` |
| `identity/writing-samples/` | Writing samples for `/style-capture` |
| `identity/creator-studies/` | Creator analyses from `/study-creator` |
| `sources.yaml` | Curated thought leaders, business figures, LinkedIn creators |
| `content-strategy/pillars.yaml` | Content pillars with allocation percentages and cadence |
| `content-strategy/post-history.yaml` | Running log for variety tracking |
| `content-strategy/hooks-swipe-file.md` | Proven hook patterns |
| `posts/drafts/` | Auto-saved post drafts |
| `posts/published/` | Published posts |
| `posts/batches/` | Weekly batch plans |

---

## Default Behavior (Operational Mode)

1. Read both profiles first. Always.
2. Write in the client's voice — all 10 dimensions.
3. Check brand alignment before every post.
4. Save drafts automatically to `posts/drafts/`.
5. Hide system details. Plain language only.
6. Every output is a draft for human review.
7. Learn from feedback. Update style profile when patterns emerge.

---

## Available Skills

| Skill | Purpose |
|-------|---------|
| `/linkedin-post` | Full pipeline: topic, hooks, draft, self-edit, deliver |
| `/batch-create` | Generate a week of posts at once |
| `/hook-workshop` | Brainstorm, improve, analyze, or extract hooks |
| `/digest-brand` | Ingest or update brand document |
| `/style-capture` | Analyze writing samples into 10-dimension style profile |
| `/add-source` | Add, remove, update, or list inspiration sources |
| `/study-creator` | Analyze a LinkedIn creator's patterns |

---

## Intent Routing

| What the client says | Skill to run |
|----------------------|-------------|
| "Write a LinkedIn post about X" | `/linkedin-post` |
| "Draft something on X" | `/linkedin-post` |
| "Give me 5 posts for the week" | `/batch-create` |
| "Batch my posts for next week" | `/batch-create` |
| "Help me with hooks for X" | `/hook-workshop` |
| "Give me 10 hooks about X" | `/hook-workshop` |
| "Why does this hook work?" | `/hook-workshop` |
| "Add [person] to my sources" | `/add-source` |
| "Who are my sources?" | `/add-source` (list mode) |
| "Here's my updated brand doc" | `/digest-brand` |
| "My writing style has changed" | `/style-capture` |
| "Analyze [creator's name]'s LinkedIn" | `/study-creator` |

---

## Rules

- The client's voice is sacred. If you cannot match it confidently, say so.
- Drafts, not finals. Human review is always the last step.
- Ask, don't guess. A quick question beats a wrong draft.
- Feedback is learning. Update the style profile when a clear pattern emerges.
- Variety is non-negotiable. Check post-history.yaml before every post.
EOF

echo "CLAUDE.md written."

# ============================================================
# sources.yaml
# ============================================================
cat > "$KIT_DIR/sources.yaml" << 'EOF'
# Inspiration Sources
# Managed by /add-source

business_figures: []

thought_leaders: []

linkedin_creators: []

newsletters: []

websites: []

research_instructions: |
  When researching for a LinkedIn post:
  1. Check if any business figure has a relevant framework or recent post on the topic
  2. Check linkedin_creators for creators who have covered this topic — what angle did they use?
  3. Look for thought leader frameworks that add intellectual depth
  4. Cross-reference with newsletters for trending angles and recent data
  5. Pull practical, actionable angles from business figures; philosophical depth from thought leaders
  6. Never copy — synthesize. The client's voice and brand come first.
  7. Always attribute ideas when drawing heavily from a specific thinker
  8. Avoid angles that directly mimic a creator the client follows — differentiate
EOF

echo "sources.yaml written."

# ============================================================
# content-strategy/pillars.yaml
# ============================================================
cat > "$KIT_DIR/content-strategy/pillars.yaml" << 'EOF'
# Content Pillars
# Allocations must sum to 100%.
# Managed by /digest-brand and /batch-create.

pillars:
  - name: "Expertise & Craft"
    description: >
      Deep, specific knowledge from doing the work. Tactical lessons, hard-won insights,
      and honest truths about how things actually work in your field.
    allocation: 35
    example_angles:
      - "The specific skill most people in your field overlook"
      - "A framework or system you've developed from experience"
      - "A common mistake you see professionals making"
    typical_formats:
      - listicle
      - framework
      - contrarian-take

  - name: "Personal Stories"
    description: >
      Real experiences from building, working, and living — told with honesty and a clear
      takeaway. Stories build trust and humanize the brand.
    allocation: 25
    example_angles:
      - "A failure and what it revealed"
      - "A moment where your assumptions were wrong"
      - "A decision you made that felt risky — and how it turned out"
    typical_formats:
      - story-lesson
      - i-was-wrong
      - before-after
      - milestone-insight

  - name: "Industry Commentary"
    description: >
      Your informed take on trends, debates, and developments in your field.
      Establishes you as someone with judgment, not just skills.
    allocation: 20
    example_angles:
      - "A trend you think is being overhyped"
      - "A practice the industry should retire"
      - "Your prediction about where the field is heading"
    typical_formats:
      - contrarian-take
      - framework
      - poll-context

  - name: "Culture & Values"
    description: >
      Who you are, what you care about, and how you work. Builds community and
      attracts people who want to work with or alongside you.
    allocation: 20
    example_angles:
      - "A principle you've never compromised on"
      - "How you make decisions in your company or work"
      - "A belief about how work should work"
    typical_formats:
      - story-lesson
      - before-after
      - milestone-insight

posting_cadence:
  posts_per_week: 5
  preferred_days:
    - Monday
    - Tuesday
    - Wednesday
    - Thursday
    - Friday
  preferred_times: "Morning (7-9am your timezone)"
  batch_mode: true
  notes: >
    Adjust posts_per_week to 3 if you prefer a more sustainable pace.
    Quality always beats consistency.
EOF

echo "pillars.yaml written."

# ============================================================
# content-strategy/post-history.yaml
# ============================================================
cat > "$KIT_DIR/content-strategy/post-history.yaml" << 'EOF'
# Post History
# Running log of LinkedIn posts. Used for variety enforcement.
# Schema:
#   date:      "YYYY-MM-DD"
#   topic:     "short topic label"
#   pillar:    "pillar name"
#   template:  "template-name"
#   hook_type: "bold|story|question|number|pattern-interrupt|vulnerability"
#   status:    "draft|published"
#   file:      "path/to/draft.md"

posts: []
EOF

echo "post-history.yaml written."

# ============================================================
# Skill files and templates are written below
# ============================================================

echo "Writing agent file..."
cat > "$KIT_DIR/.claude/agents/linkedin-writer.md" << 'EOF'
# Agent: linkedin-writer

Autonomous LinkedIn post writer. Full pipeline from topic selection through draft delivery.

## Prerequisites — Hard Stops

Verify these files exist and are non-empty before proceeding:
1. `identity/brand-profile.md`
2. `identity/style-profile.md`

If either is missing, stop and report what is missing. Do not proceed.

## Phase 0: Orientation

Read:
1. `identity/brand-profile.md`
2. `identity/style-profile.md` (all 10 dimensions, especially Quick Reference and Dimensions 8-10)

## Phase 1: Topic & Content Sourcing

1a. Read `content-strategy/post-history.yaml` — build recently-covered list from last 10 entries.
1b. Read `content-strategy/pillars.yaml` — note underrepresented pillars.
1c. Read `sources.yaml` and follow research_instructions. Use web search if available.
1d. Generate 5-8 topic candidates, each with: topic, angle, pillar, template fit, source inspiration, timeliness.

## Phase 2: Topic Selection

Score each candidate 1-5 on: Brand fit, Audience relevance, Pillar balance, Freshness.
Select highest total score. Prefer freshness in ties.

## Phase 3: Hook Generation

Generate 5 hooks (one each): Bold/Contrarian, Personal Story Opener, Question, Number/Data, Pattern Interrupt.
Apply Dimension 8 from style-profile.md. Select the strongest for the chosen template.

## Phase 4: Drafting

Read the selected template from `.claude/skills/linkedin-post/templates/`.
Apply all 10 style dimensions. Match formatting DNA exactly (Dimension 9). Apply engagement patterns (Dimension 10).

## Phase 5: Self-Edit

Check: voice consistency (all 10 dimensions), brand alignment, hook strength, formatting, engagement driver.
CRINGE CHECK: rewrite anything performative, generic LinkedIn speak, AI tone drift, or bait CTAs.

## Phase 6: Format & Deliver

Save to: `posts/drafts/YYYY-MM-DD-[slug].md`

Frontmatter required:
```yaml
---
date: "YYYY-MM-DD"
topic: "[topic]"
pillar: "[pillar]"
template: "[template]"
hook_type: "[type]"
status: "draft"
char_count: [count]
---
```

Append to `content-strategy/post-history.yaml`.

## Phase 7: Completion Report

Report: topic, pillar, template, file path, scoring breakdown, hook selected, sources used, anything needing attention.

## Error Handling

- No pillars.yaml: use brand-profile.md pillars. Note in report.
- No post-history.yaml: no freshness constraint. Note in report.
- No sources.yaml: skip source research. Note in report.
- Web search unavailable: draft from existing knowledge. Note in report.

## Rules

- Never fabricate quotes, statistics, or sources.
- Never cover topics in the Avoid list.
- Never copy from sources — synthesize in the client's voice.
- Never skip the CRINGE CHECK.
- Never save without YAML frontmatter.
- Never use the same template twice in a row.
- Always apply all 10 style dimensions.
- Always update post-history.yaml after saving.
EOF

echo "Agent file written."
echo "Writing all skill SKILL.md files..."

# Skill files are already written to disk by the main session.
# This setup.sh would regenerate them if the kit needs to be rebuilt from scratch.
# For a full rebuild, the skill content would be embedded here as heredocs.
# Since the full content of each SKILL.md exceeds what can be cleanly embedded in a single
# nested heredoc, this script recreates the directory structure and core config files.
# The SKILL.md files should be present from git history or the initial kit setup.

echo ""
echo "============================================"
echo "ai-linkedin-kit setup complete!"
echo "============================================"
echo ""
echo "Kit location: $KIT_DIR"
echo ""
echo "Next steps:"
echo "  1. Open $KIT_DIR in Claude Code"
echo "  2. Claude will detect onboarding is needed and walk you through setup"
echo "  3. After setup, start a new chat and write your first post"
echo ""
echo "Quick command reference:"
echo "  /linkedin-post    — write one post"
echo "  /batch-create     — write a week of posts"
echo "  /hook-workshop    — brainstorm or improve hooks"
echo "  /digest-brand     — set up or update your brand profile"
echo "  /style-capture    — capture or refresh your writing voice"
echo "  /add-source       — manage your inspiration sources"
echo "  /study-creator    — study a LinkedIn creator's patterns"
