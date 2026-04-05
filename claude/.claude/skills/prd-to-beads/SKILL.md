---
name: prd-to-beads
description: Break a PRD into independently-grabbable beads issues linked to a parent epic using tracer-bullet vertical slices. Use when user wants to convert a PRD epic to beads tasks, create beads implementation tickets, or break down a beads epic into work items.
---

# PRD to Beads

Break a PRD epic into independently-grabbable beads issues using vertical slices (tracer bullets).

## Process

### 1. Locate the PRD

Ask the user for the PRD source — either a beads epic ID (e.g., `bd-a1b2`) or a GitHub issue number/URL.

- **Beads epic**: fetch with `bd show <epic-id>`
- **GitHub issue**: fetch with `gh issue view <number>` (with comments), then create a beads epic from it first using `bd create "<title>" -t epic -p <priority> --body-file /tmp/beads-prd.md --json`

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so to understand the current state of the code.

### 3. Draft vertical slices

Break the PRD into **tracer bullet** issues. Each issue is a thin vertical slice that cuts through ALL integration layers end-to-end, NOT a horizontal slice of one layer.

Slices may be 'HITL' or 'AFK'. HITL slices require human interaction, such as an architectural decision or a design review. AFK slices can be implemented and merged without human interaction. Prefer AFK over HITL where possible.

<vertical-slice-rules>
- Each slice delivers a narrow but COMPLETE path through every layer (schema, API, UI, tests)
- A completed slice is demoable or verifiable on its own
- Prefer many thin slices over few thick ones
</vertical-slice-rules>

### 4. Quiz the user

Present the proposed breakdown as a numbered list. For each slice, show:

- **Title**: short descriptive name
- **Type**: HITL / AFK
- **Blocked by**: which other slices (if any) must complete first
- **User stories covered**: which user stories from the PRD this addresses

Ask the user:

- Does the granularity feel right? (too coarse / too fine)
- Are the dependency relationships correct?
- Should any slices be merged or split further?
- Are the correct slices marked as HITL and AFK?

Iterate until the user approves the breakdown.

### 5. Create the beads issues

For each approved slice, create a child issue under the epic using `bd create`. Create issues in dependency order (blockers first) so you can reference real issue IDs.

```bash
bd create "<title>" -t feature -p <priority> --parent <epic-id> --body-file /tmp/beads-slice.md --json
```

After creating each issue, add blocking dependencies between slices:

```bash
bd dep add <blocked-id> <blocker-id> --type blocks
```

Use the issue body template below for each `--body-file`.

<issue-template>
## What to build

A concise description of this vertical slice. Describe the end-to-end behavior, not layer-by-layer implementation. Reference specific sections of the parent PRD rather than duplicating content.

## Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Blocked by

- Blocked by <issue-id> (if any)

Or "None - can start immediately" if no blockers.

## User stories addressed

Reference by number from the parent PRD:

- User story 3
- User story 7

</issue-template>

Do NOT close or modify the parent epic.
