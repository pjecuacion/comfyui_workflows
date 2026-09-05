# Task Plan

## 2026-09-05 - AetherScale 2x Video Enhancement Bundle

### Scope

- Import the repaired AetherScale 2x video-enhancement workflow as its own repository bundle.
- Keep the plugin source workflow and repository copy byte-identical after repair.

### Assumptions

- `aetherscale-video-enhance-2x` is the bundle slug matching this repository's per-video/experiment structure.
- The actual source path is `C:\ComfyUI_windows_portable\ComfyUI\custom_nodes\ComfyUI-AetherScale\workflows\aetherscale_video_enhance_2x.json`; the underscores in the pasted path were Markdown escapes.

### Non-Goals

- Do not copy AetherScale source code, runtime binaries, caches, models, or generated media.
- Do not claim a full video render passed when this task verifies workflow import and graph settings only.

### Plan

- [x] Wait for approval of the cross-repository repair plan recorded in the AetherScale task file.
- [x] Copy the repaired workflow to `workflows/aetherscale-video-enhance-2x/`.
- [x] Add simple viewer-facing notes under `docs/videos/aetherscale-video-enhance-2x/`.
- [x] Validate JSON parsing and confirm the copy matches the repaired source by SHA-256.
- [x] Review the scoped diff and create one local commit without including unrelated files.

### Test Strategy

- Parse the source and repository workflow JSON files.
- Compare SHA-256 hashes after the copy.
- Confirm no generated media, runtime assets, or root-level Markdown files were added.

### Review

- Imported the frontend-verified AetherScale 0.7.2 workflow into its own bundle.
- The repository copy matches the repaired plugin source byte-for-byte.
- JSON parsing and repository structure checks pass; no runtime assets, generated media, models, or root Markdown files were added.
- A full video render was not run and is not claimed.

## 2026-08-25 - MiniMax H3 Latent Upscaler Voice-Reference Import

### Scope

- Preserve the supplied Downloads workflow and add a repository copy that keeps supplied audio as H3 voice-reference conditioning.

### Non-Goals

- Do not run a full MiniMax generation or alter the original workflow.

### Plan

- [x] Trace the reference-audio, prompt, and output-audio paths against the installed H3 implementation.
- [x] Preserve the reference-only audio path and the generated-audio export path.
- [x] Add deterministic regression coverage and validate the repository copy.

### Test Strategy

- Assert that `LoadAudio` feeds only `ref_audio_0`.
- Assert that generated H3 audio feeds `CreateVideo`.

### Review

- Corrected the earlier misinterpretation: the source clip is a voice reference, not the final soundtrack.
- Created the separate voice-reference workflow copy and retained the Downloads original unchanged.
- Runtime rendering remains intentionally unverified because this repository import does not require a costly full generation to validate its graph contract.

### Follow-up: Two-Pass Audio Preservation

- [x] Verify that reference conditioning reaches both sampling guiders in the original two-pass graph.
- [x] Add a sibling that retains first-pass generated audio while preserving second-pass latent-upscaled images.
- [x] Add graph validation for the separated audio/video outputs.
- [ ] Run a controlled render with the same image, prompt, seed, and voice reference to compare voice similarity against the original two-pass workflow.

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

## 2026-08-10 - MiniMax H3 Prompting Skill

### Scope

- Convert the supplied MiniMax H3 prompting document into an auto-discovered Codex skill.
- Keep the core skill instructions concise and preserve the complete prompting guide as a reference.
- Install the skill under `C:\Users\pjecu\.codex\skills` without modifying workflow JSON files.

### Plan

- [x] Inspect the supplied document, repository lessons, and skill-creator requirements.
- [x] Initialize `minimax-h3-prompting` with standard Codex skill metadata.
- [x] Add focused operating instructions and the complete H3 reference guide.
- [x] Validate the skill structure and metadata.
- [x] Forward-test a representative H3 prompt request without generating media.

### Test Strategy

- Run the skill creator's deterministic `quick_validate.py` check.
- Confirm `SKILL.md`, `agents/openai.yaml`, and the reference file exist.
- Use an isolated agent to invoke the installed skill on a representative Full-Reference prompt task and inspect its result.

### Review

- Installed `minimax-h3-prompting` under the user's auto-discovered Codex skills directory.
- Preserved the supplied guide byte-for-byte as `references/complete-guide.md` and kept `SKILL.md` focused on routing and execution.
- `quick_validate.py` reports `Skill is valid!`.
- The isolated Full-Reference test correctly used `reference generation + audio reuse`, stable subject/speaker IDs, `fully_copy`, audio-master timing, a locked medium close-up, exact dialogue, and `N/A` music.

## 2026-08-13 - LTX 2.3 and LTX 2.5 IA2V Workflow Variants

### Scope

- Create a dedicated LTX 2.3 start-frame-only IA2V workflow from the existing proven start-only graph.
- Create a dedicated LTX 2.3 start-middle-last-frame IA2V workflow from the existing proven middle-frame graph.
- Create an LTX 2.5 start-frame IA2V workflow from the supplied working LTX 2.5 I2V workflow.
- Create an LTX 2.5 first-and-last-frame IA2V sibling.
- Keep the supplied LTX 2.5 upscale, RTX, RIFE, synchronized output, and 2x FPS path.
- Add imported-audio conditioning instead of relying on LTX 2.5's empty generated-audio latent.

### Assumptions

- "New workflows" means both a start-frame and a first-and-last-frame LTX 2.5 IA2V variant.
- The requested LTX 2.3 middle-frame workflow means the existing start+middle+last topology, copied into its own clearly named bundle.
- The LTX 2.3 dedicated copies will preserve their proven source graphs and current defaults; changing generation timing is outside this organizational task.
- New variants will live in dedicated hyphenated workflow bundles; existing workflow files and the Downloads source remain unchanged.
- The installed native LTX 2.5 transformer, Gemma 4 encoder, video/audio VAEs, and latent upscaler remain the selected models.
- Prompt enhancement will default to off because neither optional enhancer encoder named by the attached workflow/template is installed; the main LTX 2.5 prompt encoder is installed.

### Non-Goals

- Do not modify or move existing LTX 2.3 workflows.
- Do not overwrite the supplied Downloads workflow.
- Do not add a middle-frame LTX 2.5 variant in this task.
- Do not claim a successful GPU generation unless a real ComfyUI render is run.

### Plan

- [x] Create `workflows/ltx-2-3-ia2v-start-frame/` with a dedicated start-only workflow.
- [x] Create `workflows/ltx-2-3-ia2v-start-middle-last-frame/` with a dedicated three-frame workflow.
- [x] Create `workflows/ltx-2-5-ia2v/` with start-only and first/last-frame IA2V workflows.
- [x] Add external audio load, duration trim, LTX 2.5 audio-VAE encode, frozen audio-latent conditioning, and decoded output audio.
- [x] Preserve the attached workflow's latent upscale, RTX 2x, RIFE 2x, and `fps * 2` output wiring.
- [x] Replace the leftover `video/H3MULTI/MASTER` output prefix with an LTX 2.5-specific prefix.
- [x] Add simple viewer notes and update the workflow catalogs.
- [x] Add deterministic integration tests for JSON validity, graph links, models, audio conditioning, frame guides, and FPS/interpolation wiring.
- [x] Run the LTX tests plus the existing workflow test suite and record verified results.

### Test Strategy

- Parse each new workflow as JSON and require unique node and link IDs within every graph.
- Confirm the LTX 2.3 variant has one start image and no middle/last-frame guides.
- Confirm the LTX 2.3 middle variant has start, middle, and last image inputs, with middle guides at the selected middle frame and last guides at frame index `-1`.
- Confirm both LTX 2.5 IA2V variants load external audio, trim it to the requested duration, encode it with the LTX 2.5 audio VAE, and do not use `LTXVEmptyLatentAudio`.
- Confirm the first/last variant applies frame guides at frame indices `0` and `-1` in both generation passes.
- Confirm both LTX 2.5 outputs keep RTX 2x before RIFE 2x, preserve audio, and encode at twice the model FPS.
- Confirm all selected LTX 2.5 model names use the native split model folders/loaders.
- Treat a short real ComfyUI generation as the final runtime smoke test; structural tests alone are not runtime proof.

### Review

- Added dedicated start-only and start+middle+last LTX 2.3 files. Canonical JSON comparison confirms both are graph-identical to their existing proven sources.
- Added LTX 2.5 start-only and first/last IA2V variants without changing the supplied Downloads workflow; its SHA-256 remains `76D9B0406B418CB1F5E4F0BEB8FFB1F1D2C6BAB9FB717763A060B354712A1708`.
- Replaced only the empty generated-audio latent with imported-audio trim, LTX 2.5 audio-VAE encoding, and a zero noise mask. The second-pass audio carry and final mux connection remain intact.
- Preserved the native LTX 2.5 transformer, Gemma 4 encoder, separate video/audio VAEs, latent spatial upscaler, two samplers, tiled decode, RTX 2x, RIFE 2x, and doubled output FPS.
- The LTX 2.5 first/last variant applies the last image at frame index `-1` in both passes and uses `LTXVCropGuides` to carry guide-aware conditioning from the low-resolution pass into the high-resolution pass.
- The focused integration test passes, all other existing integration/bug tests pass, and `git diff --check` passes.
- The pre-existing `minimax-frame-notes.test.ps1` still fails because it hard-codes six custom MiniMax workflows while seven tracked custom files now exist. This task did not change MiniMax workflows or that unrelated test.
- The running ComfyUI instance exposes every required LTX, audio, guide, RTX, and RIFE node type. A real GPU render was not run, so first-use runtime generation remains the smoke test.

## 2026-08-13 - Add Crisp Enhance LoRA to All LTX 2.5 Workflows

### Scope

- Copy the LoRA model path from the updated Downloads workflow into both repository LTX 2.5 IA2V workflows.
- Use `Power Lora Loader (rgthree)` with `LTX2.3_Crisp_Enhance.safetensors`, enabled at strength `1`.
- Feed the LoRA-adjusted model to both low-resolution and high-resolution sampling guiders.
- Preserve each workflow's existing prompt, inputs, timing, imported-audio path, guides, upscale, interpolation, and output settings.

### Assumptions

- "All the LTX 2.5 workflows" means the two JSON files under `workflows/ltx-2-5-ia2v/`; no other repository workflow contains LTX 2.5 model markers.
- The four-node routing shown in the updated Downloads workflow is intentional: LoRA loader, one named model setter, and two named model getters.
- The unrelated Downloads changes to prompt, image, duration, frame rate, resolution, preview nodes, layout, and audio-trim schema are not part of this request.

### Non-Goals

- Do not modify any LTX 2.3 workflow or the Downloads source file.
- Do not replace the first/last-frame subgraph with the start-frame subgraph.
- Do not change the selected LoRA filename or strength beyond the supplied values.
- Do not claim GPU runtime success without a real ComfyUI render.

### Plan

- [x] Add collision-free LoRA loader, setter, and getter nodes to both LTX 2.5 subgraphs.
- [x] Replace direct transformer-to-guider links with the shared LoRA-adjusted model path.
- [x] Document the required LoRA and custom-node dependencies.
- [x] Extend the LTX integration test with exact LoRA and no-bypass assertions.
- [x] Parse both JSON files and verify nodes, links, metadata, focused tests, existing tests, and diff scope.

### Test Strategy

- Require exactly one enabled `Power Lora Loader (rgthree)` in each LTX 2.5 subgraph.
- Require the exact `LTX2.3_Crisp_Enhance.safetensors` filename and strength `1`.
- Confirm the transformer feeds the LoRA loader, its model output feeds the named setter, and both guiders receive the corresponding named getter output.
- Confirm neither guider remains directly connected to the base transformer.
- Re-run global node/link integrity checks and all deterministic repository PowerShell tests.
- Keep a short real ComfyUI generation as the final runtime smoke test.

### Review

- Updated both and only the two repository workflows containing the native LTX 2.5 transformer marker.
- Added the supplied model-only `Power Lora Loader (rgthree)` configuration with `LTX2.3_Crisp_Enhance.safetensors`, enabled at strength `1`; CLIP remains disconnected.
- Routed the adjusted model through one KJNodes setter and two getters so the low-resolution and high-resolution guiders both use the same LoRA-adjusted transformer.
- Used nodes `426`-`429` and links `810`-`813` in the start-frame graph. Used collision-free nodes `432`-`435` and links `834`-`837` in the first/last graph.
- Updated both root and embedded-subgraph ID counters to their true maxima to prevent future ComfyUI ID reuse.
- Preserved the first/last-frame guide path exactly, including links `811`-`833`, both frame indices at `-1`, and the crop between sampling passes.
- Preserved the repository workflows' existing prompts, images, audio, duration, frame rate, resolution, upscaling, interpolation, and output settings instead of copying unrelated Downloads changes.
- The updated Downloads source remains unchanged at SHA-256 `0512347EC46F71CB547041F41BE2ED35431E118070ADC13040A8CA26A9F29258`.
- The focused LTX integration test passes and now checks exact loader/KJNodes metadata, LoRA settings, global IDs, bidirectional link metadata, no base-model bypass, and the complete first/last guide route.
- The local LoRA file exists and hashes to `020529377CE07B1235D8050505DD38ADC3BC9DC49A191F318A7CCF3921354053`. The installed rgthree commit matches the workflow metadata, KJNodes provides the frontend Set/Get nodes, and the running ComfyUI API exposes the Power LoRA loader and the selected LoRA filename.
- The repository suite remains at seven passing tests and one pre-existing unrelated MiniMax frame-note count failure. `git diff --check` and touched-file whitespace checks pass.
- A real GPU render was not run. Because the selected filename identifies an LTX 2.3 LoRA while the workflows use LTX 2.5, a short render remains required to verify runtime model compatibility and visual quality.

## 2026-08-15 - Add MiniMax H3 Face Refine Variant

### Scope

- Preserve the Downloads source and create a separately named workflow variant under `workflows/`.
- Insert a complete rectangular-mask H3 face-refine pass between the native MiniMax H3 image output and RTX/RIFE post-processing.
- Preserve the existing first/last image conditioning, prompt, LoRAs, duration, generated audio, RTX 2x, RIFE 2x, and 48 FPS output.
- Add the required face detector, optional person fallback, identity model, and generated-audio lock to the portable ComfyUI runtime.

### Assumptions

- The first variant will refine one face per pass using a replaceable identity-reference image and InsightFace matching when detections are ambiguous.
- The non-SAM stitch path is the safest initial setup because it has fewer dependencies and is the node pack's recommended starting point.
- The second H3 pass will reuse the workflow's selected H3 model family and Turbo LoRA settings through an external refinement branch because the existing subgraph does not expose MODEL, CLIP, or VAE outputs.

### Non-Goals

- Do not overwrite the Downloads workflow or modify existing repository workflows.
- Do not add a two-person chained refine pipeline in the first variant.
- Do not enable SAM in the first variant.
- Do not claim visual success until a short real render is inspected.

### Plan

- [x] Copy the supplied workflow into a dedicated sibling bundle with a clear face-refine filename.
- [x] Add the face/person detector models, InsightFace identity model, and NativeAudioLock; verify exact paths and checksums.
- [x] Add and wire Track/Crop, H3 img2img latent injection, per-frame denoise, second sampling/decode, and Stitch Back nodes.
- [x] Wire tracker canvas dimensions and native batch length into the second H3 pass; preserve original generated audio for final muxing.
- [x] Route stitched frames into RTX 2x, then RIFE 2x, then the existing 48 FPS video output.
- [x] Add concise in-graph notes explaining reuse, single-face selection, timing, and detector limitations.
- [x] Add deterministic integration tests for required nodes, complete link paths, model settings, frame/FPS preservation, and source-file preservation.
- [ ] Load the variant through the running ComfyUI API and run a short native-frame smoke render before treating it as usable.

### Test Strategy

- Parse both the new variant and source as JSON and verify the source hash remains unchanged.
- Require globally unique node/link IDs plus bidirectional link metadata at the root and embedded-subgraph levels.
- Prove the active image path is `MiniMax H3 -> face refine -> RTX -> RIFE -> 48 FPS output` and that no crop batch is sent directly to the final video node.
- Prove tracker `canvas_w` and `canvas_h` drive the refine H3 dimensions, and tracker `transform` drives both denoise and stitch.
- Prove original native frames drive stitch `base_images`, decoded refined crops drive `refined_crops`, and original generated audio still drives the final muxer.
- Verify all required node types are exposed by `/object_info`, then inspect encoded frame count, FPS, duration, audio duration, and representative face frames from a short render.

### Review

- Created `workflows/minimax-h3-fast-loras-face-refine/minimax_h3_fast_loras_face_refine.json` as a deterministic sibling of the Downloads source; the source remains unchanged at SHA-256 `79432A17B0A1BC619470F0493D22D73E85D7956A69CDC222A4C2F418FF92BD87`.
- Added a dedicated replaceable identity/H3 reference image plus the complete native-frame route: Track/Crop -> ReferenceToVideo -> InjectVideoLatent -> NativeAudioLock -> PerFrameDenoise -> Sampler -> Decode -> Stitch -> RTX 2x -> RIFE 2x -> 48 FPS output.
- Preserved original generated audio for the final mux while also feeding it into NativeAudioLock so the face pass can retain lip motion.
- Installed `face_yolov8m.pt` (`717923C...943E5F`), `person_yolov8m-seg.pt` (`C8AB26...AE81E`), `insightface 0.7.3`, `buffalo_l`, and `ComfyUI-H3-NativeAudioLock` commit `11a95f6`.
- A fresh ComfyUI instance on port 8190 exposes every required node, including NativeAudioLock. A tracker-only API smoke test succeeds on a photographic human face.
- The local cartoon reference produces `No face detected in any frame`; both YOLO face detection and InsightFace miss it. The person fallback only fills gaps after at least one real face detection, so it cannot make an entirely undetected cartoon clip refinable.
- The focused graph/asset test passes, the builder is deterministic, the shared frame-note test now covers all eight custom MiniMax workflows, and seven other repository tests pass.
- The pre-existing Multishot Turbo test still fails because the installed `ComfyUI-H3-Multishot` source no longer contains its expected forced-four-step expression. This task did not modify that unrelated node pack.
- A full face-refined H3 render was not run: the supplied workflow's first image `1024834.jpg` is absent from the ComfyUI input folder, and its available cartoon reference is not detected as a face.
