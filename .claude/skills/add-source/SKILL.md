# Skill: add-source

Manage the client's inspiration sources — the thought leaders, business figures, LinkedIn creators, newsletters, and websites they draw ideas from for their LinkedIn content.

## Trigger

This skill activates when the user invokes `/add-source` or asks to add, remove, update, or list their inspiration sources.

## Inputs

- **With arguments:** A natural language description of what to do (add someone, remove someone, update details, etc.)
- **No arguments:** List all current sources in a readable format.

## Instructions

### 1. Determine the action

Parse the user's input to figure out the intent:

| Intent | Signal words / patterns |
|--------|------------------------|
| **Add** | "add", a name with context, "start following", "I want to include" |
| **Remove** | "remove", "delete", "drop", "stop following" |
| **Update** | "update", "change", "add X to Y", "edit" |
| **List** | No arguments, "list", "show", "what sources do I have" |

If the intent is ambiguous, ask one short clarifying question before proceeding.

### 2. Read sources.yaml

Read `sources.yaml` from the project root.

If the file does not exist, create it with this skeleton:

```yaml
linkedin_creators: []

business_figures: []

thought_leaders: []

newsletters: []

websites: []

research_instructions: |
  When researching for a LinkedIn post:
  1. Check if any LinkedIn creator uses formats relevant to the topic
  2. Look for recent takes from business figures on the topic
  3. Cross-reference with thought leaders for frameworks and depth
  4. Pull practical angles from business figures, philosophical depth from thought leaders
  5. Never copy — synthesize. The client's voice and brand come first.
  6. Always attribute ideas when drawing heavily from a specific thinker
  7. LinkedIn creators inform STRUCTURE and FORMAT, not voice
```

### 3. Execute the action

#### Adding a source

1. **Categorize** the source:
   - **linkedin_creators** — people known primarily for their LinkedIn content and audience building
   - **business_figures** — entrepreneurs, executives, marketers, creators with active social/content presence
   - **thought_leaders** — philosophers, authors, researchers, thinkers known for ideas and frameworks
   - **newsletters** — email publications, Substack, etc.
   - **websites** — blogs, media sites, resource hubs

2. **Research briefly** to fill in missing fields.

3. **Build the entry** following the schema for that category:

   **linkedin_creators:**
   ```yaml
   - name: "Full Name"
     linkedin_url: "https://linkedin.com/in/..."
     signature_formats: ["listicle", "framework", "story-lesson"]
     topics: ["topic1", "topic2"]
     hook_style: "bold-statement"
     notes: "Short description of what makes their content distinctive"
   ```

   **business_figures:**
   ```yaml
   - name: "Full Name"
     platforms: [linkedin, youtube, twitter]
     topics: ["topic1", "topic2"]
     newsletter_url: "https://..."
     notes: "Optional"
   ```

   **thought_leaders:**
   ```yaml
   - name: "Full Name"
     type: "philosopher/author/researcher"
     key_ideas: ["idea1", "idea2"]
     works: ["Book 1", "Book 2"]
     notes: "How their ideas relate to the client's content"
   ```

   **newsletters:**
   ```yaml
   - name: "Newsletter Name"
     url: "https://..."
     topics: ["topic1", "topic2"]
   ```

   **websites:**
   ```yaml
   - name: "Site Name"
     url: "https://..."
     topics: ["topic1", "topic2"]
   ```

4. Append the new entry to the correct category list.

#### Removing a source

1. Search all categories for a name match (case-insensitive, partial match is fine).
2. If multiple matches, ask which one to remove.
3. Remove the entry.

#### Updating a source

1. Find the existing entry.
2. Apply the requested change.
3. Preserve all other fields.

#### Listing sources

Present all sources in a clean, readable format grouped by category:

```
LinkedIn Creators
  - Justin Welsh — solopreneurship, content systems
    Style: listicle, framework | Hook: bold-statement
  - [next person...]

Business Figures
  - Alex Hormozi — business growth, offers
    Platforms: YouTube, Twitter, LinkedIn

Thought Leaders
  - Ryan Holiday — Stoic philosophy, discipline
    Key works: The Obstacle Is the Way, Ego Is the Enemy

Newsletters
  - [name] — [topics]

Websites
  - [name] — [topics]
```

Do NOT show raw YAML. Do NOT show the `research_instructions` block.

### 4. Write back to sources.yaml

Always preserve the `research_instructions` block exactly as it was.

### 5. Confirm the change

Tell the user what you did in plain language.

## Rules

- **Never show raw YAML to the client.**
- **Always preserve `research_instructions`** when writing to `sources.yaml`.
- **Alphabetize entries** within each category.
- **Deduplicate.** Before adding, check if the source already exists.
- **Be opinionated about categorization.** If someone is primarily known for LinkedIn content, put them under `linkedin_creators` even if they also have a business.
- **Omit optional fields** rather than leaving them as empty strings.
- **Handle edge cases gracefully** — unknown names, missing sources, unexpected YAML structure.
