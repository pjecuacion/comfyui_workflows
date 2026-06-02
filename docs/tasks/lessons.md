# Lessons

## LESSON-001 - Workflow Repo Is Not An App Release Repo

### What Went Wrong

I applied app-development changelog/versioning habits to a public ComfyUI workflow-sharing repository.

### Why It Happened

The broad operational rulebook mentioned changelogs and versioning, but this repo does not ship a packaged app or versioned product.

### New Rule

Do not create or maintain app-style changelog files for this repo. Use git history plus lightweight docs under `docs/videos/` or `docs/tasks/` when useful.

### Correct Behavior

For a new YouTube workflow bundle, add the workflow JSON under `workflows/<video-slug>/`, add notes/prompts under `docs/videos/<video-slug>/`, and skip changelog/version files unless the user specifically asks for them.

## Working Rules

- Keep all markdown documentation under `docs/`.
- Use one workflow bundle folder per YouTube video or major experiment.
- Keep generated media and model weights out of git.
- This repo is exempt from app-style changelog and version-bump requirements.
