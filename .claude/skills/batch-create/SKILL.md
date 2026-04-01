# Skill: batch-create

Generate a week of LinkedIn posts at once. The core workflow for consistent LinkedIn creators.

## Trigger

Activate when the user says `/batch-create` or asks for:
- "Give me 5 posts for the week"
- "Batch my posts"
- "Plan my content for next week"
- "Write a week of LinkedIn posts"

## Process

### Step 1 — Load context

Read these files:
- `identity/brand-profile.md` — brand, audience, pillars
- `identity/style-profile.md` — writing voice (all 10 dimensions)
- `content-strategy/pillars.yaml` — pillar allocation targets and posting cadence
- `content-strategy/post-history.yaml` — what has been posted recently
- `sources.yaml` — inspiration sources

**Hard stop** if brand or style profiles are missing.

### Step 2 — Generate content calendar

Create a content plan for the requested number of posts (default: 5 for a Monday-Friday week).

For each post slot, assign:
- **Day** (e.g., Monday, Tuesday...)
- **Pillar** (which content pillar it serves)
- **Template** (which post format to use)
- **Topic** (specific topic or angle)
- **Hook direction** (brief note on hook approach)

### Step 3 — Enforce variety rules

The calendar MUST follow these rules:
1. **No two consecutive posts use the same template.** A story-lesson on Monday means no story-lesson on Tuesday.
2. **All active pillars represented at least once per week.** Check pillar allocation targets.
3. **At least one personal/story-driven post.** Builds connection.
4. **At least one opinion/contrarian post.** Drives engagement.
5. **Topics don't repeat recent history.** Check post-history.yaml.
6. **Energy varies.** Mix lighter, punchy posts with deeper, narrative ones.

### Step 4 — Present for approval

Show the content calendar as a clean table:

> "Here's your content plan for the week:"
>
> | Day | Pillar | Format | Topic | Hook Direction |
> |-----|--------|--------|-------|----------------|
> | Mon | Expertise | Framework | ... | Bold claim about... |
> | Tue | Personal | Story-Lesson | ... | Story opener: "I was..." |
> | ... | ... | ... | ... | ... |
>
> "Want to swap anything, or should I start writing?"

Wait for approval or adjustments before proceeding.

### Step 5 — Write all posts

On approval, write all posts using a streamlined process:
- **Hooks:** Generate 2 hooks per post (instead of the standard 5) for faster selection. Or, if the client says "just write them all," auto-select the strongest hook per post.
- **Drafting:** Follow the `/linkedin-post` pipeline (Phases 3-5) for each post.
- **Self-edit:** Full Phase 4 self-edit on each post.

### Step 6 — Save and deliver

1. Save the batch plan to `posts/batches/YYYY-MM-DD-weekly-batch.md`
2. Save each individual post to `posts/drafts/YYYY-MM-DD-[slug].md`
3. Update `content-strategy/post-history.yaml` with all new entries
4. Present all posts together with a summary:

> "Here's your week of posts! [number] posts covering [pillars mentioned]. Each one is saved as a draft. Want me to adjust any of them?"

## Rules

- **Variety is sacred.** The batch MUST have format variety. Reject any calendar that uses the same template twice in a row.
- **Pillar balance matters.** Track allocation percentages and flag if a pillar is being neglected.
- **Each post stands alone.** Even in a batch, every post should work independently. No "as I mentioned yesterday" references.
- **Save everything.** Never let a draft get lost. Auto-save after each post is written.
- **The client approves the plan before you write.** Do not start writing until the calendar is confirmed.
