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

## 2026-08-05 - MiniMax H3 Duration-Safe Frame Interpolation

### Scope

- Preserve the original WIP workflow and create a separate repaired JSON workflow.
- Add installed `RIFE VFI` interpolation after RTX spatial upscaling.
- Keep MiniMax generation at its native 24 FPS and encode interpolated output at 48 FPS.
- Preserve the generated audio connection so video and audio remain synchronized.

### Assumptions

- A 2x interpolation target of 48 FPS is preferred because the installed RIFE node uses an integer multiplier.
- `rife49.pth` is the preferred installed-node default and may download on first use if it is not cached.
- Interpolation after spatial upscaling gives the final output full-resolution interpolated motion, at higher VRAM cost.

### Non-Goals

- Do not change MiniMax model sampling, prompt, resolution, duration snapping, or SageAttention settings.
- Do not overwrite the Downloads source workflow.
- Do not claim runtime generation success without running the workflow in ComfyUI.

### Plan

- [x] Copy the source workflow into the existing `workflows/minimaxh3-fp8/` bundle.
- [x] Add `RIFE VFI` between RTX upscaling and the final `CreateVideo` node.
- [x] Encode MiniMax's fixed 2x interpolation output explicitly at 48 FPS.
- [x] Keep original audio connected to the final video.
- [x] Validate JSON parsing, node/link integrity, unique link IDs, and duration/FPS math.
- [x] Add a review section with verified results and any runtime caveats.

### Test Strategy

- Parse the repaired workflow as JSON.
- Assert the RIFE node uses multiplier `2` and receives RTX-upscaled frames.
- Assert final `CreateVideo` receives interpolated frames, original audio, and 48 FPS.
- Assert the source workflow hash is unchanged.
- Check that a 294-frame 12-second-grid generation becomes 587 interpolated frames; at 48 FPS this is about 12.23 seconds, within one output frame of the original 12.25-second sequence.

### Review

- Added `video_minimax_h3_t2v fp8 sageattention rtx upscaled interpolated.json` beside the existing MiniMax H3 workflows.
- Added installed `RIFE VFI` with cached `rife47.pth`, multiplier 2, float16 precision, and conservative batch size 1.
- BUG-001 showed the original FPS expression serialized incorrectly and left the encoded output at 24 FPS, producing 24.46 seconds of video from a 12.25-second source.
- Removed the fragile FPS expression and set the fixed MiniMax 2x output explicitly to 48 FPS.
- Moved RIFE before the 4x RTX upscaler so interpolation runs on the native-resolution frames.
- The deterministic integration check passes and confirms RIFE frame wiring, audio preservation, doubled FPS, and globally unique link IDs.
- The BUG-001 regression check confirms first-to-last-frame timing is identical before and after 2x interpolation.
- The workflow parses successfully and `git diff --check` reports no whitespace errors.
- Runtime generation remains unverified because running the ComfyUI graph would perform a full MiniMax generation.

## 2026-08-06 - MiniMax H3 Multishot Workflow Import

### Scope

- Download the three workflow JSON files from `joeygambino/MiniMax-H3-Multishot-Workflow` into a dedicated repository bundle.
- Install the required `ComfyUI-H3-Multishot` node pack into the active portable ComfyUI installation.
- Create a local-ready AIO workflow copy that selects the MiniMax H3 safetensors models already installed.
- Preserve the upstream workflow files unchanged for comparison.

### Assumptions

- Start with `H3_Multishot_AIO.json`; the MEMORY workflow is intended for 2-5 minute projects and Keyframes serves a different single-generation use case.
- Existing FP8 MiniMax H3 model, NVFP4 text encoder, and video/audio VAEs will be reused.
- No GGUF model download or ComfyUI-GGUF architecture patch is needed unless GGUF is chosen later.

### Non-Goals

- Do not download an additional 20+ GB GGUF model set.
- Do not replace or modify existing MiniMax workflow bundles.
- Do not run a full multi-shot generation during installation.

### Plan

- [x] Download the upstream JSON workflows into `workflows/minimax-h3-multishot/upstream/`.
- [x] Install the latest fixed `ComfyUI-H3-Multishot` custom-node pack.
- [x] Create `H3_Multishot_AIO_local-safetensors.json` with existing local model selections.
- [x] Validate JSON parsing, required node types, model paths, and source hashes.
- [x] Document simple usage and any restart requirement in the task review.

### Test Strategy

- Confirm all workflow files parse as JSON.
- Confirm the local-ready AIO workflow selects existing model filenames.
- Confirm every custom H3 node type is registered by the installed node pack source.
- Confirm upstream workflow hashes match the Hugging Face downloads.

### Review

- Downloaded the three upstream workflows and verified their SHA-256 hashes against fresh Hugging Face cache downloads.
- Installed `ComfyUI-H3-Multishot` at commit `81b97bb7eae824a4390052b4ab0e23c4e10ff20b`.
- Created a local AIO copy selecting the existing FP8 MiniMax model and NVFP4 text encoder; no GGUF weights were downloaded or patched.
- Portable ComfyUI Python successfully imported the node pack and registered the required loader, sampler, memory, and keyframe nodes.
- Integration validation and Python compilation passed.
- ComfyUI must be fully restarted before loading the local workflow.

## 2026-08-06 - MiniMax H3 Turbo Single-Shot Workflow

### Scope

- Download the full non-pruned INT8 MiniMax H3 DiT into the active portable ComfyUI model folder.
- Download only the recommended non-EMA Turbo LoRA checkpoint.
- Install the official MiniMax H3 Turbo custom-node pack.
- Create a separate single-shot Turbo workflow bundle using 6 sampling steps.
- Preserve the existing pruned FP8 and multishot workflows unchanged.

### Assumptions

- Reuse the installed NVFP4 MiniMax text encoder and existing video/audio VAEs.
- Base the new graph on the working single-shot workflow, retaining SageAttention, RTX upscaling, and corrected 2x RIFE interpolation at 48 FPS.
- Keep Turbo separate from multishot because the multishot sampler does not expose Turbo's required dual video/audio schedule.

### Non-Goals

- Do not download experimental `.bin` training checkpoints or the other three LoRA variants.
- Do not apply the Turbo LoRA to pruned FP8/INT8 MiniMax models.
- Do not modify or merge Turbo into the multishot AIO workflow.

### Plan

- [x] Download `minimax_h3_fl2va_int8_convrot.safetensors` to `models/diffusion_models/`.
- [x] Download `minimax_h3_turbo_4step_ckpt500.safetensors` to `models/loras/`.
- [x] Install and validate `ComfyUI-MiniMax-H3-Turbo`.
- [x] Create a dedicated `workflows/minimax-h3-turbo/` workflow at 6 steps.
- [x] Validate model size/hash, Turbo nodes, scheduler, sampling path, interpolation ordering, audio, and 48 FPS output.
- [x] Add usage notes and final verification evidence.

### Test Strategy

- Verify each downloaded file against its Hugging Face repository metadata.
- Import the Turbo node pack in the portable ComfyUI Python environment and confirm node registration.
- Parse the workflow and assert the non-pruned base, recommended LoRA, simple scheduler at 6 steps, Turbo sampler, original audio path, RIFE before RTX upscale, and explicit 48 FPS output.
- Run existing MiniMax interpolation regression tests to ensure duration remains correct.

### Review

- Downloaded the 34,038,892,334-byte full non-pruned INT8 model and the 779,849,872-byte recommended non-EMA Turbo LoRA into the active portable ComfyUI folders.
- Both local SHA-256 hashes exactly match the Hugging Face LFS metadata.
- Installed `ComfyUI-MiniMax-H3-Turbo` at commit `da13db9d059f188ea0f30795dc8eea7975c2893c`; portable ComfyUI Python imports it and registers both required nodes.
- Created a separate 6-step Turbo workflow using the existing NVFP4 text encoder and existing video/audio VAEs.
- The graph uses `UNET -> Turbo LoRA -> SageAttention`, the special Turbo sampler, and the simple scheduler at 6 steps.
- Post-processing is `decode -> RIFE 2x -> RTX 4x -> CreateVideo 48 FPS`, with generated audio still connected.
- The new integration test and the BUG-001 duration regression test pass. A full generation was not run because it is a long GPU render; runtime rendering remains the first-use smoke test.

## 2026-08-06 - Fix MiniMax Turbo AAC Save Failure

### Scope

- Prevent non-finite generated audio samples from crashing `SaveVideo`.
- Keep generated audio connected and preserve normal audio samples.
- Update only the dedicated Turbo workflow and its local support node.

### Plan

- [x] Trace the fatal stack to AAC encoding and separate unrelated startup warnings.
- [x] Add and install a deterministic finite-audio guard node.
- [x] Wire the guard between audio decode and `CreateVideo`.
- [x] Add BUG-002 documentation and regression coverage.
- [x] Run the complete MiniMax workflow test set.

### Test Strategy

- Feed the guard NaN, positive infinity, negative infinity, excessive peaks, and a valid sample.
- Confirm every output sample is finite and within `[-1, 1]`.
- Confirm valid in-range audio and sample rate remain unchanged.
- Confirm the workflow path is `VAEDecodeAudio -> finite guard -> CreateVideo`.

### Review

- The error report proved video generation and RIFE completed; `SaveVideo` failed only while feeding invalid audio samples to AAC.
- Added `MiniMaxH3AudioFiniteGuard`, installed it in portable ComfyUI, and wired it into the reproducible workflow builder.
- BUG-002 and all existing MiniMax tests pass.
- ComfyUI must be restarted once so it registers the new guard node.

## 2026-08-06 - BUG-003 Black MiniMax Output

### Scope

- Identify the first stage producing black Turbo video.
- Compare Turbo, stock, full INT8, pruned INT8, native, interpolated, and upscaled paths.
- Do not roll back the whole ComfyUI checkout without user approval.

### Plan

- [x] Verify the saved MP4 pixels rather than relying on the preview.
- [x] Bypass RIFE and RTX and test native output.
- [x] Test Turbo and stock samplers with full and pruned INT8 models.
- [x] Compare current ComfyUI against the last-known working checkout.
- [x] Remove unsuccessful experimental core patches.
- [x] Synchronize the portable Python packages with the updated requirements.
- [x] Restart and confirm a real MiniMax generation produces visible output.

### Test Strategy

- Use FFprobe for streams, frame count, FPS, dimensions, and duration.
- Use FFmpeg `signalstats` for luma, saturation, and pixel variation.
- Use FFmpeg `blackdetect` for full-clip black detection.
- Require a real non-black encoded output before marking BUG-003 fixed.

### Review

- The git updater changed the core checkout but did not synchronize the portable Python packages.
- Installing the current requirements removed the frontend/AIMDO mismatch warning.
- After restart, the user confirmed MiniMax generated visible output on current commit `2eb609766a`; rollback was unnecessary.

## 2026-08-06 - MiniMax H3 Multishot Turbo AIO

### Scope

- Create a separate local-safetensors Multishot Turbo workflow.
- Reuse the installed pruned INT8 model, Turbo LoRA, text encoder, and VAEs.
- Preserve the working standard Multishot workflow unchanged.
- Add Turbo's required dual video/audio sampler to the AIO multishot execution path.

### Non-Goals

- Do not replace the standard 20-step Multishot workflow.
- Do not initially add RIFE or RTX upscaling to the smoke-test workflow.
- Do not claim runtime success until a real two-shot render is completed.

### Plan

- [x] Compare the standard Multishot and Turbo sampling paths.
- [x] Add an optional Turbo mode to the installed Multishot node.
- [x] Create the separate two-shot local-safetensors Turbo workflow.
- [x] Add deterministic integration and regression tests.
- [x] Validate node import, graph structure, model selections, and standard-mode compatibility.

### Test Strategy

- Confirm Turbo mode resolves the registered `MiniMaxH3TurboSampler` and forces four sigmas.
- Confirm standard mode still uses the selected normal sampler and configured step count.
- Confirm the workflow applies the Turbo LoRA before the Multishot sampler.
- Confirm native output remains at 24 FPS with audio connected and no interpolation/upscaling.

### Review

- Added a separate two-shot native workflow using the local pruned INT8 base and recommended Turbo LoRA.
- Extended the installed AIO sampler with an opt-in Turbo mode that forces the registered four-step dual-AV sampler.
- Preserved standard Multishot behavior when Turbo mode is disabled.
- Python compilation and all five MiniMax integration/regression tests pass.
- A real GPU render remains the final smoke test; restart ComfyUI before loading the new workflow.

## 2026-08-06 - MiniMax Frame Count Notes

### Scope

- Add a plain-language `17k + 5` frame-count explanation to all six custom MiniMax workflows.
- Preserve downloaded files under `upstream/` byte-for-byte.

### Plan

- [x] Identify every custom MiniMax workflow and its size-reference note.
- [x] Append the shared frame-count and duration table.
- [x] Verify all six notes and confirm upstream files remain untouched.

### Test Strategy

- Parse every custom MiniMax JSON file.
- Require exactly one shared frame-count note in each custom workflow.
- Confirm no upstream workflow contains the locally added note.

### Review

- Added the same plain-language frame rule and duration table to all six custom MiniMax workflows.
- Included the Multishot rule that the listed duration applies to each shot.
- Kept all downloaded upstream reference workflows unchanged.
- The shared-note test and Multishot Turbo graph test pass.
