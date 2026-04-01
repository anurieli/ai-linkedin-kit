# Skill: study-creator

Analyze a LinkedIn creator's patterns across all 10 style dimensions and save a detailed study file. This helps the client understand what makes admired creators effective and optionally borrow specific patterns.

## Trigger

This skill activates when the user says things like:
- "Analyze [creator's name]'s LinkedIn"
- "Study how [creator] writes"
- "Break down [creator]'s content style"
- "/study-creator [name]"

## Communication style

Warm, analytical, and educational. The client is learning from other creators — frame findings as patterns to understand, not rules to copy.

## Execution steps

### Step 1 — Identify the creator and gather content

Ask the client for:
1. The creator's name
2. Optionally: 5-10 pasted LinkedIn posts from this creator

If the client provides posts, use those directly. If not:
1. Search the web for examples of the creator's LinkedIn content
2. If web search yields limited results, ask the client to paste 5-10 posts from the creator's LinkedIn profile

> "I'll need some of [creator's name]'s actual posts to analyze properly. Could you paste 5-10 of their LinkedIn posts? Just copy and paste them in — I'll take it from there."

### Step 2 — Analyze across all 10 style dimensions

Study the creator's content through the same 10 dimensions used in `/style-capture`:

1. **Sentence Architecture** — sentence length patterns, paragraph density, formatting
2. **Vocabulary & Diction** — formality, jargon, signature phrases
3. **Tone & Emotional Register** — primary tone, vulnerability, humor, energy
4. **Rhetorical Patterns** — openings, transitions, closings, devices
5. **Perspective & Voice** — person, reader address, authority stance
6. **Content Patterns** — examples, references, abstraction level
7. **Rhythm & Flow** — pacing, whitespace, cadence
8. **Hook Patterns** — how they open posts, emotional temperature, hook types
9. **Formatting DNA** — line breaks, emoji, emphasis, whitespace, post length
10. **Engagement Patterns** — closings, CTAs, reader address, comment style

Additionally, note:
- **Templates/genres they favor** — which post formats do they use most?
- **What makes their content distinctive** — the one thing you'd recognize them by
- **Posting cadence** — how often they post, if observable
- **Content pillars** — what themes they return to

### Step 3 — Save the study

Write to `identity/creator-studies/[creator-name-lowercase].md`:

```markdown
---
creator: "[Full Name]"
analyzed_date: "YYYY-MM-DD"
sample_count: <number of posts analyzed>
---

# Creator Study: [Full Name]

## Quick Summary
[2-3 sentence overview of what makes this creator distinctive]

## Signature Patterns
- [The 3-5 most defining characteristics]

## Full Analysis

### Sentence Architecture
[findings]

### Vocabulary & Diction
[findings]

### Tone & Emotional Register
[findings]

### Rhetorical Patterns
[findings]

### Perspective & Voice
[findings]

### Content Patterns
[findings]

### Rhythm & Flow
[findings]

### Hook Patterns
[findings with specific examples]

### Formatting DNA
[findings with specific examples]

### Engagement Patterns
[findings with specific examples]

## Favorite Templates
[Which post formats they use most, with examples]

## What to Learn From Them
[Actionable patterns another creator could adapt]

## What NOT to Copy
[Things that are uniquely them and would feel inauthentic if borrowed]
```

### Step 4 — Present findings

Walk the client through the key discoveries conversationally:

> "Here's what I found about [creator]'s LinkedIn style. [2-3 most interesting patterns]. Want me to walk through the full analysis, or jump to the parts you're most curious about?"

### Step 5 — Offer to borrow patterns

> "Would you like to borrow any of these patterns for your own profile? I can update your style profile to note specific influences — things like their hook style, formatting approach, or engagement techniques."

If yes, update `identity/style-profile.md` with noted influences under the relevant dimensions. Always frame as "inspired by" not "copied from."

## Rules

- **This is analysis, not worship.** Frame creators as case studies, not authorities. Every creator has weaknesses too.
- **Patterns, not content.** Extract structural patterns. Never suggest the client copy specific posts or ideas.
- **The client's voice comes first.** Borrowed patterns must be adapted to fit the client's existing style, not override it.
- **Be specific.** "They use short sentences" is useless. "They average 8-12 words per sentence, use fragments for emphasis, and never write paragraphs longer than 2 lines" is useful.
- **Include direct quotes** from the creator's posts as evidence wherever possible.
