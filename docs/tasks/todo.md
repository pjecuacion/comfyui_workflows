# Task Plan

## 2026-06-02 - Per-Video Workflow Restructure

### Scope

- Organize ComfyUI workflow JSON files by YouTube-video bundle.
- Add companion markdown for the LTX 2 camera-control LoRA prompts.
- Move documentation under `docs/` to match the repository rulebook.
- Update workflow indexes.

### Assumptions

- `ltx-2-camera-control-loras` is the canonical slug for the most recent video.
- The Downloads workflow file is the correct workflow for the LTX 2 camera-control LoRA video.
- This repository is a workflow-sharing repo, not a packaged Python app, so no SemVer version surface exists yet.

### Non-Goals

- Do not edit the internal ComfyUI workflow graphs.
- Do not add generated videos, images, models, LoRAs, or checkpoints.
- Do not create root markdown files.

### Plan

- [x] Create required docs directories and write a checkable restructuring plan.
- [x] Move existing root docs into `docs/`.
- [x] Move existing workflow JSON into `workflows/ltx-2-3-claymation-demo/`.
- [x] Copy the new LTX 2 camera-control LoRA workflow into `workflows/ltx-2-camera-control-loras/`.
- [x] Add prompt markdown from the pasted table.
- [x] Update workflow index docs.
- [x] Verify JSON validity, root markdown cleanup, and expected files.

### Test Strategy

- Validate every committed workflow JSON file parses as JSON.
- Confirm no `.md` files remain in the repository root.
- Confirm the new per-video workflow and prompt files exist.
- Review `git status --short` for expected moves and additions.

### Review

- Verified both workflow JSON files parse successfully.
- Verified no `.md` files remain in the repository root.
- Verified the copied LTX 2 camera-control LoRA workflow matches the Downloads source by SHA-256 hash.
- Verified expected docs and workflow files exist.

## 2026-06-02 - Repo Exception and LoRA Source Docs

### Scope

- Remove app-style changelog files from this workflow-sharing repo.
- Document the repo exception so future updates do not recreate changelog files unnecessarily.
- Add the Lightricks LTX-2 Hugging Face collection as the source for the camera-control LoRAs.

### Plan

- [x] Record the repo exception in `docs/requirements.md`.
- [x] Record the correction in `docs/tasks/lessons.md`.
- [x] Add the Hugging Face collection source to the camera-control LoRA docs.
- [x] Remove generated changelog files.
- [x] Verify no changelog docs remain and the LoRA source is discoverable.
