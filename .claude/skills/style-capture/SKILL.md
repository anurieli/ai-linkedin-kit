# /style-capture

Analyze the client's writing samples and generate a comprehensive "Style DNA" profile that captures their unique LinkedIn voice. The output lives at `identity/style-profile.md` and is consumed by other skills (like `/linkedin-post`) to produce drafts that sound like the client wrote them.

This is an extended 10-dimension analysis — the 7 core writing dimensions plus 3 LinkedIn-specific dimensions.

---

## When to use

- The client is onboarding and needs their voice captured for the first time.
- New writing samples have been added and the profile needs refreshing.
- The client says the drafts "don't sound like me" and the profile needs tuning.

## Inputs

Writing samples come from one of three places:

1. **Files in `identity/writing-samples/`** — any `.md`, `.txt`, or `.html` files dropped there.
2. **Pasted text** — the client pastes writing directly into the conversation.
3. **LinkedIn posts** — pasted directly (the best source for this kit).

You need **at least 3 samples** (ideally 5-10) for an accurate profile. If fewer are available:

- Tell the client plainly: "I have [N] sample(s) so far. I can work with this, but the profile will be more accurate with 5-10 pieces of your writing. Want to add more, or should I ask you some questions instead?"
- Offer **interview mode** (see below).

## Three Input Paths

### Path 1: Has LinkedIn posts (best)
Analyze all 10 dimensions directly from the posts. This produces the most accurate profile because LinkedIn-specific dimensions (hooks, formatting, engagement) are observed directly.

### Path 2: Has other writing but no LinkedIn posts
Analyze the 7 base dimensions from their writing. Then interview for the 3 LinkedIn-specific dimensions (Hook Patterns, Formatting DNA, Engagement Patterns). Offer `/study-creator` on admired creators to help inform LinkedIn-specific choices.

### Path 3: No writing samples
Run full interview mode for all 10 dimensions. Strongly recommend the creator study path — studying admired creators helps the client articulate what they want their LinkedIn voice to be.

## Interview mode (no samples or supplemental)

If the client has no writing samples, or wants to supplement, run a conversational interview.

**For base dimensions (1-7):**
- "When you write, do you tend to keep sentences short and punchy, or do you lean into longer, flowing ones?"
- "How do you like to open a piece? Jump right into a story? Ask a question? State something bold?"
- "Are there words or phrases you catch yourself using a lot?"
- "How personal do you get? Do you share behind-the-scenes moments, or keep it more professional?"
- "If your writing had a vibe, what would it be? Coffee with a friend? TED talk? Late-night journal entry?"
- "Any words or tones you actively avoid?"

**For LinkedIn dimensions (8-10):**
- "How do you like to open a LinkedIn post? Bold statement? Question? Story?"
- "Do you use emojis in your posts? If so, how — as bullet points, for emphasis, or not at all?"
- "How do you feel about line breaks — do you like one idea per line with lots of whitespace, or do you write in paragraphs?"
- "How do you usually end a post? Ask a question? Make a statement? Invite people to comment?"
- "Do you ever directly ask for engagement, or do you prefer to let it happen naturally?"

## Analysis process

### Step 1: Gather and read

- Read all files in `identity/writing-samples/`.
- Combine with any text the client pasted.
- Combine with any interview answers.
- Note the total sample count and approximate word count.

### Step 2: Analyze across the 10 Style DNA dimensions

Work through each dimension carefully. Use direct quotes from the samples as evidence.

#### Dimension 1: Sentence Architecture
- Average sentence length (short / medium / long)
- Sentence variety patterns — do they mix lengths? Use fragments? Favor compound sentences?
- Paragraph length tendency (1-2 sentences? 3-5? Dense blocks?)
- Use of lists, headers, bold, italics, and other formatting

#### Dimension 2: Vocabulary & Diction
- Formality level on a 1-10 scale
- Jargon usage — do they lean into industry terms, avoid them, or define them?
- Signature words and phrases repeated across samples
- Words or constructions clearly avoided

#### Dimension 3: Tone & Emotional Register
- Primary tone (e.g., warm, authoritative, playful, serious, irreverent)
- How they handle vulnerability and personal sharing
- Humor style, if present (dry, self-deprecating, witty, none)
- Energy level — high-energy motivational vs. calm reflective vs. between

#### Dimension 4: Rhetorical Patterns
- How they open pieces (anecdote? question? bold statement? scene-setting?)
- How they transition between ideas
- How they close (call to action? reflection? question? callback?)
- Use of repetition, parallelism, rhetorical questions

#### Dimension 5: Perspective & Voice
- Person preference — first ("I"), second ("you"), third, or a mix
- How they address the reader — direct "you"? Inclusive "we"?
- Level of personal disclosure
- Authority stance — peer, mentor, expert, friend, coach, or blend

#### Dimension 6: Content Patterns
- How they use examples — personal stories, case studies, data, analogies, metaphors
- Reference style — citations, name-drops, quotes, links
- Abstraction level — concrete/practical vs. philosophical/conceptual
- Balance of insight with actionability

#### Dimension 7: Rhythm & Flow
- Pacing — quick punchy sections vs. slow building vs. mix
- Use of white space and deliberate line breaks
- Cadence patterns — where they speed up, where they slow down
- Signature structural moves

#### Dimension 8: Hook Patterns (LinkedIn-Specific)
- How they open posts — questions, bold claims, story openers, numbers, pattern interrupts
- Emotional temperature of hooks — confident, vulnerable, provocative, curious
- Single-line hooks vs. multi-line openings
- What makes their hooks feel like THEM vs. generic LinkedIn bait

#### Dimension 9: Formatting DNA (LinkedIn-Specific)
- Line break frequency — every sentence? Every 2-3? Paragraph blocks?
- Emoji strategy — none / sparing-structural / liberal / signature emojis
- Bold, italic, caps usage for emphasis
- Whitespace patterns
- List formatting preference — numbered, bulleted, emoji-bulleted, dashed
- Post length tendency — short punchy (600-800), medium narrative (1200-1800), long deep (2000-3000)

#### Dimension 10: Engagement Patterns (LinkedIn-Specific)
- How they close posts — CTA, question, reflection, restatement
- Explicit engagement asks vs. organic
- Parenthetical asides, direct reader address ("you know the feeling")
- Comment reply style — brief, conversational, thoughtful

### Step 3: Generate the style profile

Write `identity/style-profile.md` with the structure defined below.

### Step 4: Present and iterate

Show the client the finished profile and ask: **"Does this sound like you?"**

Walk them through the key findings in plain language. Invite corrections:
- "Anything here that feels off?"
- "Is there something about your voice I missed?"
- "Any dimension you'd want to push in a different direction for LinkedIn specifically?"

Update the profile based on feedback. Bump the version number each time.

---

## Output format: `identity/style-profile.md`

```markdown
---
generated_date: YYYY-MM-DD
sample_count: <number>
interview_used: true/false
version: 1
---

# Style DNA Profile

## Quick Reference

- **Tone:** [primary tone in 2-3 words]
- **Formality:** [number]/10
- **Sentence style:** [short description]
- **Person:** [first/second/third/mix]
- **Reader relationship:** [peer/mentor/expert/friend/coach]
- **Energy:** [high/medium/low]
- **Humor:** [style or "none"]
- **Signature move:** [one defining pattern]
- **Hook style:** [bold-claim/question/story/number/mixed]
- **Formatting style:** [whitespace-heavy/moderate/paragraph-blocks]
- **Engagement style:** [question-close/CTA/reflection/organic]

---

## Do / Don't

### Do
- [Specific instruction] — *Example: "[direct quote or constructed example]"*
- [At least 8 items]

### Don't
- [Specific anti-pattern] — *Instead, they would say: "[alternative]"*
- [At least 8 items]

---

## Dimension 1: Sentence Architecture
[Findings with evidence]

## Dimension 2: Vocabulary & Diction
[Findings with evidence]

## Dimension 3: Tone & Emotional Register
[Findings with evidence]

## Dimension 4: Rhetorical Patterns
[Findings with evidence]

## Dimension 5: Perspective & Voice
[Findings with evidence]

## Dimension 6: Content Patterns
[Findings with evidence]

## Dimension 7: Rhythm & Flow
[Findings with evidence]

## Dimension 8: Hook Patterns
[Findings with evidence]

## Dimension 9: Formatting DNA
[Findings with evidence]

## Dimension 10: Engagement Patterns
[Findings with evidence]

---

## Voice Samples

3-5 short LinkedIn post openings (each 3-5 lines) written from scratch in the captured style. These demonstrate the voice so the client can hear it played back.

### Sample 1: [Topic label]
[Opening in the client's voice]

### Sample 2: [Topic label]
[Opening in the client's voice]

### Sample 3: [Topic label]
[Opening in the client's voice]

---

## Profile Notes

- Number of samples analyzed and any limitations.
- Whether interview mode was used.
- Areas where confidence is lower.
- Suggestions for improving the profile.
```

---

## Guidelines

- **Plain language always.** Say "you tend to write short, punchy sentences" not "your mean sentence length is 8.3 words."
- **Quote the client's own words.** The most convincing evidence is their own writing.
- **Be specific, not vague.** "Warm tone" is too generic. "Warm like a mentor sharing hard-won lessons — direct but never preachy" is useful.
- **The Quick Reference section is critical.** Other skills will read this first.
- **The Do/Don't section is actionable.** Each item should be concrete enough for a drafting skill to follow.
- **Voice Samples prove the profile works.** If the client reads them and says "that sounds like me," the profile is good.
- **Bump the version** on every update.
- **YAML frontmatter is required.** Other skills depend on it.
