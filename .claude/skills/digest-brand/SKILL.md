# Skill: digest-brand

Ingest a client's brand document and produce a standardized `identity/brand-profile.md` that the rest of the LinkedIn writing system can rely on.

## When to use

Use this skill when the user says things like:
- "Here's my brand doc"
- "Set up my brand profile"
- "digest-brand" or "/digest-brand"
- "I want to create a brand profile"
- Pastes brand-related text or drops a file into conversation

## Communication style

The client is not technical. All communication must be:
- Warm and encouraging — they are trusting you with their brand
- Plain language — no jargon, no references to files, formats, or system internals
- Concise — respect their time, but be thorough when asking for clarification
- Reassuring — let them know what you are doing at each step and that they have final say

## Execution steps

### Step 1 — Locate the brand document

Check for source material in this priority order:

1. **Pasted text in conversation** — If the user pasted brand information directly, use that.
2. **File in the project** — Look for files in `identity/brand-document-original/`. Read any file found there.
3. **URL provided** — If the user shared a link, fetch and read it.
4. **Nothing found** — Move to the conversational interview flow (see Step 1b).

When you find the source material, tell the client:

> "Thanks! I found your brand document. Let me read through it and pull out everything I need."

### Step 1b — Conversational interview (no document available)

If there is no brand document, offer to build the profile through conversation:

> "It looks like there's no brand document on file yet — that's totally fine. I can walk you through a few questions to build your brand profile from scratch. It usually takes about 5-10 minutes. Want to get started?"

If they agree, ask questions covering each section from Step 3, one section at a time. Group related questions together to keep the conversation flowing naturally. Do not dump all questions at once.

Suggested interview order:
1. "What's the name of your brand or business? Do you have a tagline or mission statement?"
2. "Who are you writing for on LinkedIn? Describe your ideal reader."
3. "What does your brand stand for? What values drive your content?"
4. "What are the 3-5 big themes you always come back to?"
5. "How would you describe the tone of your writing? (e.g., casual and witty, serious and data-driven, warm and personal)"
6. "What topics should you always cover? Anything you want to steer clear of?"
7. "What makes your perspective different from others in your space?"
8. "What do you want to be known for on LinkedIn specifically?"
9. "When someone sees your post in the feed, what should their first thought be?"
10. "What is your one-sentence LinkedIn positioning?"

After collecting answers, proceed to Step 3.

### Step 2 — Read the full document

Read the entire brand document carefully. Do not skim. Pay attention to:
- Explicit statements ("Our tone is...")
- Implicit signals (the document's own tone, word choices, level of formality)
- Contradictions or gaps

### Step 3 — Extract and structure

Organize the information into these standardized sections:

#### Brand Identity
- Brand/business name
- Tagline (if any)
- Mission statement or purpose

#### Target Audience
- Primary reader personas
- Demographics (role, industry, career stage)
- Psychographics (motivations, pain points, aspirations)

#### Brand Values & Positioning
- Core values (3-5)
- Market position — how the brand sees itself relative to alternatives
- Brand personality in a few words

#### LinkedIn Positioning
- How the user wants to be perceived on LinkedIn specifically
- One-sentence LinkedIn bio pitch
- What they want to be known for on the platform
- First impression goal — when someone sees their post, what should their first thought be

#### Messaging Pillars
- The 3-5 recurring themes the brand always returns to
- Brief description of each pillar

#### Tone Guidelines
- Overall tone description
- What the tone IS and what it is NOT
- Any specific language preferences or restrictions

#### Topics
**Cover:**
- Topics to always lean into

**Avoid:**
- Topics to explicitly avoid
- LinkedIn-specific boundaries: politics, competitor mentions, salary specifics, religious proselytizing, vague motivational platitudes, other people's struggles without permission
- Sensitivities to respect

#### Unique POV / Differentiators
- What makes this brand's perspective distinct
- Why a reader would follow this person over alternatives
- Any contrarian or non-obvious positions the brand holds

#### Visual/Formatting Preferences
- Emoji use (yes/no/sparingly)
- Line break style preferences
- Use of bold, lists, callouts

### Step 4 — Flag gaps

If any section is missing or ambiguous, do NOT guess. Ask the client directly:

> "I got a lot of great detail from your document. There are a few areas I'd love your input on before I finalize:
>
> 1. [question about missing info]
> 2. [question about ambiguity]
> 3. [question about LinkedIn-specific positioning if not covered]"

Wait for the client's answers before proceeding.

### Step 5 — Write the brand profile

Write the output to `identity/brand-profile.md` with this structure:

```markdown
---
generated_date: "YYYY-MM-DD"
source: "<how the profile was created>"
version: 1
---

# Brand Profile — [Brand Name]

## Brand Identity
...

## Target Audience
...

## Brand Values & Positioning
...

## LinkedIn Positioning
...

## Messaging Pillars
...

## Tone Guidelines
...

## Topics
### Cover
- ...
### Avoid
- ...

## Unique POV / Differentiators
...

## Visual/Formatting Preferences
...
```

### Step 6 — Present summary for review

After writing the file, present a clear summary:

> "Here's what I've put together for your brand profile. Take a look and let me know if anything feels off or if you'd like to change something."

Provide a concise summary of each section. End with:

> "Would you like to change anything, or does this look good?"

### Step 7 — Iterate on feedback

If the client wants changes:
1. Acknowledge their feedback warmly
2. Make the edits to `identity/brand-profile.md`
3. Increment the `version` number in the YAML frontmatter
4. Show them what changed
5. Ask again if they are happy with it

Repeat until the client confirms they are satisfied.

## Output

- **File written:** `identity/brand-profile.md`
- **Format:** Markdown with YAML frontmatter
- **Frontmatter fields:** `generated_date`, `source`, `version`

## Important notes

- Never invent brand details. If something is unclear, ask.
- Preserve the client's own language when possible — use their words, not corporate synonyms.
- If the brand document contradicts itself, surface the contradiction rather than picking a side.
- The brand profile is a living document. Let the client know they can update it anytime.
- If `identity/brand-profile.md` already exists, read it first and ask whether to start fresh or update.
