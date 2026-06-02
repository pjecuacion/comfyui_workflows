# Requirements

This repository stores ComfyUI workflows and companion notes for YouTube videos.

## Business Requirements

- Organize workflows by YouTube video or experiment so viewers can find the exact files used in a video.
- Keep workflow JSON files under `workflows/<video-slug>/`.
- Keep all documentation under `docs/`.
- Do not commit generated media, model weights, checkpoints, or caches.
- Include prompt notes when a video depends on specific prompts or LoRA names.
- Keep viewer-facing instructions simple enough to follow without deep repo knowledge.
- Treat this repo as an exception to app-development changelog and version-bump rules.

## Current Structure Requirement

Each video bundle should use this shape:

```text
workflows/<video-slug>/
docs/videos/<video-slug>/
```

The `workflows/` folder contains ComfyUI JSON files. The matching `docs/videos/` folder contains prompts, notes, requirements, and troubleshooting.

## Process Exception

This repository does not maintain `docs/changelog_plain.md` or `docs/changelog_tech.md`. Changes are tracked through git history and lightweight docs under `docs/videos/` or `docs/tasks/` when useful.
