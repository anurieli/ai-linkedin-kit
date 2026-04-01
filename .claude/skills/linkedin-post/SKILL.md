# LinkedIn Post Skill

Write a complete LinkedIn post draft that sounds like the client wrote it themselves.

## Trigger

Activate when the user says `/linkedin-post` or asks to write, draft, create, or start a LinkedIn post.

## Important — Communication Style

The client is not technical. All communication must be warm, clear, and in plain language. Never show YAML contents, file paths, config details, or internal process mechanics unless explicitly asked. Speak to them like a trusted creative collaborator.

## Entry Points

The user can kick things off in any of these ways:

1. **Topic-driven** — "Write a LinkedIn post about delegation"
2. **Story-driven** — "I had this experience today [story]. Turn it into a post."
3. **Reaction-driven** — "I just saw [link/take]. I want to react to this on LinkedIn."
4. **Template-driven** — "Write a contrarian take about hiring"
5. **Pillar-driven** — "I need a personal story post" (references pillars.yaml)
6. **Auto-suggest** — No input given. Check sources, post history, pillar balance, then suggest 3 topics with templates. Wait for the client to pick one.
7. **Conversational** — Natural language. Extract the core topic and confirm before proceeding.

---

## Phase 1: Context & Strategy Loading

### 1a. Load project context

Read these files to ground yourself in the client's world:

- `identity/brand-profile.md` — brand positioning, audience, messaging pillars, LinkedIn positioning
- `identity/style-profile.md` — writing voice across all 10 dimensions
- `content-strategy/pillars.yaml` — content pillars with allocation targets
- `content-strategy/post-history.yaml` — what has been posted recently
- `sources.yaml` — curated thought leaders, business figures, LinkedIn creators

**If `brand-profile.md` or `style-profile.md` do not exist**, stop and tell the client:

> "Before we write, I need your brand and voice on file. Let's run a quick setup first."

Do not proceed without both identity files.

### 1b. Strategy check

- Determine which content pillar this post serves
- Check post history: what has been posted recently? What pillar is underserved? What template has not been used?
- If no template specified, recommend one based on topic + variety needs
- If auto-suggest mode, generate 3 topic options with recommended templates

### 1c. Confirm

Present a brief summary:

> "Here's what I'm thinking: [topic], using the [template] format. This hits your [pillar] pillar, which hasn't gotten much love recently. Sound good?"

Wait for confirmation before proceeding.

---

## Phase 2: Hook Generation (THE critical phase)

The hook is the single most important element of a LinkedIn post. It determines whether anyone reads the rest.

Generate **5 hook options**, each a different strategy:

1. **Bold/contrarian statement** — a strong claim that challenges conventional wisdom
2. **Personal story opener** — drops the reader into a specific moment
3. **Question that provokes** — makes the reader pause and think
4. **Number/data-driven** — specificity that signals substance
5. **Pattern interrupt** — unexpected framing that breaks the scroll

Present all 5 to the client:

> "Here are 5 ways to open this post. Pick one, or tell me what direction to go."

**Wait for selection before proceeding.** Never auto-pick. The hook is everything on LinkedIn — it must be the client's choice.

---

## Phase 3: Draft

### Write the full post

- Use the selected hook + chosen template structure from `.claude/skills/linkedin-post/templates/`
- Apply all 10 style dimensions from the style profile
- Respect character limits for the template
- Apply Formatting DNA (line breaks, spacing, emoji, emphasis) from Dimension 9
- Weave in references naturally — LinkedIn-native style ("A friend told me..." not "According to Dr. Smith...")
- End with an engagement driver from the style profile's Dimension 10 (question, prompt, restatement)

---

## Phase 4: Self-Edit (Highly Opinionated)

Before presenting anything, run through these checks:

### Voice consistency (against style-profile.md)
- All 10 style dimensions honored
- Signature words and phrases present
- Anti-patterns avoided

### Brand alignment (against brand-profile.md)
- Messaging pillars reinforced
- Audience fit confirmed
- LinkedIn positioning reflected
- Values present in framing

### Hook strength
- "Would I stop scrolling for this?"
- Does it work before the "see more" fold (~140 characters on mobile)?
- Does it create an open loop the reader needs to close?

### Formatting check
- Mobile-readable? (60%+ of LinkedIn is mobile)
- Enough whitespace? One idea per line?
- Scannable on a small screen?
- Emoji usage matches style profile?

### Length check
- Within the template's target character range?
- Every sentence earns its place?

### Engagement driver check
- Ending invites response?
- CTA natural, not forced?
- Matches the style profile's engagement patterns?

### Cringe check (LinkedIn-specific)
- Anything performative or virtue-signaling? Rewrite it.
- "Agree?" at the end? Remove it.
- Humble-bragging disguised as a lesson? Reframe it.
- Generic motivational poster language? Make it specific.
- "Tag someone who needs to hear this"? Delete it.
- Fabricated or exaggerated story? Flag it.

Revise as needed. The first draft is never the final draft.

---

## Phase 5: Deliver

### Present the post

Share the draft with the hook highlighted separately:

> "Here's your post! The hook is: '[hook text]'. Take a look and let me know what you think."

### Save the draft

Save to `posts/drafts/YYYY-MM-DD-[slug].md` with YAML frontmatter:

```markdown
---
date: "YYYY-MM-DD"
topic: "topic in plain language"
pillar: "which content pillar"
template: "template-name"
hook_type: "bold-claim/story/question/number/pattern-interrupt"
status: "draft"
---

[Post content]
```

### Update post history

Append an entry to `content-strategy/post-history.yaml`.

### Prompt next action

> "Want me to adjust anything? Or should I write the next one?"

---

## Phase 6: Iterate

When the client gives feedback:
1. Acknowledge it warmly
2. Make the edits
3. Re-run Phase 4 self-edit on the changed sections
4. Present the updated version
5. Save the updated draft (overwriting)
6. Repeat until satisfied

---

## File Reference

| File | Purpose | Required? |
|------|---------|-----------|
| `identity/brand-profile.md` | Brand positioning, audience, pillars | Yes — stop without it |
| `identity/style-profile.md` | 10-dimension writing voice | Yes — stop without it |
| `content-strategy/pillars.yaml` | Content pillar targets | No — works without it |
| `content-strategy/post-history.yaml` | Recent post log | No — works without it |
| `sources.yaml` | Curated sources | No — works without it |
| `.claude/skills/linkedin-post/templates/` | Post templates | Yes — needs at least one |

## Guiding Principle

The post should feel like the client sat down on a great writing day and wrote it in 10 minutes. The style profile is the contract. Every line should pass the test: "Would they actually post this?"
