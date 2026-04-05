---
name: write-prd-beads
description: Create a PRD through user interview, codebase exploration, and module design, then submit as a beads epic using the bd CLI. Use when user wants to write a PRD for beads, create a beads epic, or plan a new feature with beads issue tracking.
---

This skill creates a PRD and submits it as a beads epic. You may skip steps if unnecessary.

## Prerequisites

Run `bd list --json 2>/dev/null` to verify beads is initialized. If it fails, tell the user to run `bd init` first and stop.

## Process

1. Ask the user for a long, detailed description of the problem they want to solve and any potential ideas for solutions.

2. Explore the repo to verify their assertions and understand the current state of the codebase.

3. Interview the user relentlessly about every aspect of this plan until you reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one.

4. Sketch out the major modules you will need to build or modify to complete the implementation. Actively look for opportunities to extract deep modules that can be tested in isolation.

   A deep module (as opposed to a shallow module) is one which encapsulates a lot of functionality in a simple, testable interface which rarely changes.

   Check with the user that these modules match their expectations. Check with the user which modules they want tests written for.

5. Once you have a complete understanding of the problem and solution, write the PRD using the template below and create a beads epic.

## Creating the Epic

Write the full PRD content to a temporary file, then create the epic:

```bash
bd create "<epic title>" -t epic -p <priority> --body-file /tmp/beads-prd.md --json
```

Priority mapping: 0=critical, 1=high, 2=medium, 3=low, 4=backlog.

Show the user the created epic ID so they can use it to generate linked tasks later.

## PRD Template

Use this as the `--body-file` content:

```
## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## User Stories

A LONG, numbered list of user stories:

1. As an <actor>, I want a <feature>, so that <benefit>

Example:
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending

This list should be extremely extensive and cover all aspects of the feature.

## Implementation Decisions

A list of implementation decisions that were made:

- The modules that will be built/modified
- The interfaces of those modules that will be modified
- Technical clarifications from the developer
- Architectural decisions
- Schema changes
- API contracts
- Specific interactions

Do NOT include specific file paths or code snippets. They may become outdated.

## Testing Decisions

A list of testing decisions:

- A description of what makes a good test (only test external behavior, not implementation details)
- Which modules will be tested
- Prior art for the tests (similar types of tests in the codebase)

## Out of Scope

Things that are out of scope for this PRD.

## Further Notes

Any further notes about the feature.
```
