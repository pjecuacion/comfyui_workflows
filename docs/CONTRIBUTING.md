# Contributing

This repo is mostly a personal workflow collection, but clean contributions are welcome.

## Good Contributions

- New ComfyUI workflow JSON files under `workflows/<video-slug>/`.
- Fixes to broken or outdated workflows.
- Notes about missing node packs or model requirements.
- Small documentation improvements.

## Workflow Guidelines

- Use clear folder slugs that match the YouTube video or experiment.
- Use clear filenames that describe the model or purpose.
- Avoid committing generated images, videos, model files, checkpoints, or caches.
- Include a short note in `docs/workflows.md` when adding a workflow.
- Add video-specific notes under `docs/videos/<video-slug>/`.
- Mention custom node packs and important model requirements when known.

## Before Opening a PR

- Load the workflow in ComfyUI at least once.
- Remove personal output paths where possible.
- Keep large generated media out of git.
