# ai-linkedin-kit

A personal LinkedIn writing system powered by Claude. It learns your voice, understands your brand, and writes posts that sound like you — not like AI.

---

## What it is

This is a folder that lives on your computer. Inside it is everything Claude needs to write LinkedIn content in your authentic voice: your brand profile, your writing style, your content strategy, and templates for every post format.

Once set up, you point Claude at this folder and say "write a post about X." Claude reads your files, writes the post, and saves the draft — all formatted for LinkedIn, in your voice.

---

## What you need

- **Claude Code** (what you're probably using right now) — the best experience, full access to all skills
- **Or Claude.ai** — paste the key identity files into a project for access from anywhere

No coding required. No technical setup. Just a conversation.

---

## What you get

**7 skills you can call by name:**

| Skill | What it does |
|-------|-------------|
| `/linkedin-post` | Writes one LinkedIn post: hooks, draft, edit, save |
| `/batch-create` | Writes a full week of posts in one session |
| `/hook-workshop` | Generate, improve, analyze, or extract hooks |
| `/digest-brand` | Sets up or updates your brand profile |
| `/style-capture` | Analyzes your writing to capture your voice |
| `/add-source` | Manages your list of inspiration sources |
| `/study-creator` | Studies a LinkedIn creator's patterns |

**10 post templates:**
Story Lesson, Contrarian Take, Listicle, I Was Wrong, Before/After, Carousel Script, Poll + Context, Milestone + Insight, Framework, and Thread Series.

**Your content files:**
- Brand profile — who you are and how you want to be perceived on LinkedIn
- Style profile — your voice across 10 dimensions (including hook style, formatting, and engagement patterns)
- Content pillars — the themes you post about and how often
- Post history — a log that keeps your content varied
- Hooks swipe file — proven opening lines organized by type

---

## Getting started

### First run (onboarding)

Open this folder in Claude and just start talking. Claude will walk you through setup:

1. **Your brand** — who you are, who you serve, what you stand for on LinkedIn. Takes 5-10 minutes. If you have a bio or brand doc, share it.

2. **Your voice** — Claude will analyze your writing samples to capture how you write. LinkedIn posts are ideal, but any writing works. No samples? Claude will interview you.

3. **Your content pillars** — the 3-5 themes you want to be known for. Claude will help you define them.

4. **Your sources** — the thinkers, creators, and publications that inform your thinking.

5. **Your posting rhythm** — how often you want to post and whether you prefer one post at a time or weekly batches.

Setup takes 15-20 minutes. After that, writing posts takes minutes.

### After setup

Open a new chat, point it at this folder, and tell Claude what you want:

- "Write a post about why most companies hire wrong"
- "Give me 5 posts for this week"
- "Help me with hooks for a post about [topic]"
- "Study how [creator name] writes on LinkedIn"

Claude handles the rest.

---

## Available commands

You can use natural language or these specific commands:

**Writing:**
- `/linkedin-post` — write one post (walks you through hooks, draft, review)
- `/batch-create` — write a full week of posts at once
- `/hook-workshop` — brainstorm, improve, or analyze hooks

**Setup and management:**
- `/digest-brand` — set up or update your brand profile
- `/style-capture` — capture or refresh your writing voice
- `/add-source` — add, remove, or list your inspiration sources
- `/study-creator` — study a LinkedIn creator's writing patterns

---

## Your files at a glance

```
ai-linkedin-kit/
├── identity/
│   ├── brand-profile.md         — your brand and LinkedIn positioning
│   ├── style-profile.md         — your 10-dimension voice profile
│   ├── brand-document-original/ — drop original brand docs here
│   ├── writing-samples/         — drop writing samples here
│   └── creator-studies/         — analyses of creators you admire
├── content-strategy/
│   ├── pillars.yaml             — your content themes and posting cadence
│   ├── post-history.yaml        — log of past posts for variety tracking
│   └── hooks-swipe-file.md      — proven opening lines by type
├── posts/
│   ├── drafts/                  — auto-saved post drafts
│   ├── published/               — move posts here after you publish
│   └── batches/                 — weekly batch plans and outputs
└── sources.yaml                 — your curated inspiration sources
```

---

## FAQ

**Do I need to use the exact command names?**
No. You can say "write a LinkedIn post about X," "study how Justin Welsh writes," or "help me think through some hooks." Claude understands natural language.

**What if my voice changes over time?**
Run `/style-capture` any time to update your voice profile. It reads new writing samples or re-interviews you.

**Can I use this from my phone?**
Yes, with limitations. On Claude.ai, create a project and paste in your `identity/brand-profile.md`, `identity/style-profile.md`, and `sources.yaml` files. Posts won't auto-save to your computer, but you can copy them manually.

**What are the 10 style dimensions?**
Seven base dimensions (sentence architecture, vocabulary, tone, rhetorical patterns, perspective, content patterns, rhythm) plus three LinkedIn-specific ones: hook patterns (how you open), formatting DNA (line breaks, emoji, post length), and engagement patterns (how you close and invite response).

**Can I add my own templates?**
Yes — add any `.md` file to `.claude/skills/linkedin-post/templates/` and reference it by name when asking for a post.

**What if a draft doesn't sound like me?**
Tell Claude specifically what's off. It will check your style profile, identify the drift, fix it, and update the profile if a recurring pattern emerges.

**Can I use this for a team or client?**
Yes — one kit per person or brand. If managing multiple LinkedIn profiles, create a separate kit folder for each.
