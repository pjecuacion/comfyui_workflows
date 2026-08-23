# Workflow Catalog

This page tracks the workflows currently shared in this repo.

## LTX IA2V Frame Variants

**LTX 2.3 start frame:** `workflows/ltx-2-3-ia2v-start-frame/video_ltx2_3_ia2v_start_frame.json`

**LTX 2.3 start, middle, and last frames:** `workflows/ltx-2-3-ia2v-start-middle-last-frame/video_ltx2_3_ia2v_start_middle_last_frame.json`

**LTX 2.5 start frame:** `workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_start_frame_upscaled_interpolated.json`

**LTX 2.5 first and last frames:** `workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_first_last_frame_upscaled_interpolated.json`

The LTX 2.5 variants use imported audio, native split LTX 2.5 model loaders, the enabled `LTX2.3_Crisp_Enhance.safetensors` LoRA at strength 1 for both sampling passes, latent spatial upscaling, RTX 2x super-resolution, and RIFE 2x interpolation.

## LTX 2 Camera-Control LoRAs

**Folder:** `workflows/ltx-2-camera-control-loras/`

**File:** `workflows/ltx-2-camera-control-loras/video_ltx2_3_ia2v_working.json`

**Video notes:** `docs/videos/ltx-2-camera-control-loras/`

**Purpose:** A ComfyUI workflow for testing LTX 2 camera-control LoRAs across jib and dolly camera moves.

**LoRA source:** [Lightricks LTX-2 collection on Hugging Face](https://huggingface.co/collections/Lightricks/ltx-2)

**Included prompt notes:**

- `docs/videos/ltx-2-camera-control-loras/prompts.md`

**Before running:**

- Install any missing custom nodes reported by ComfyUI.
- Confirm the LTX model and LoRA files exist in your local ComfyUI model folders.
- Download the camera-control LoRAs from the Lightricks LTX-2 Hugging Face collection.
- Check prompt text, input image/video inputs, output path, and video settings before running.
- Run a short test first because camera-control LoRA results can vary by prompt and seed.

## LTX 2.3 Image/Text-to-Video Claymation Demo

**Folder:** `workflows/ltx-2-3-claymation-demo/`

**File:** `workflows/ltx-2-3-claymation-demo/video_ltx2_3_it2v_prince-does-ai-claymation-demo.json`

**Purpose:** A ComfyUI video workflow for an LTX 2.3 image/text-to-video style generation, with video output handled by Video Helper Suite.

**Detected node packs:**

- `comfy-core`
- `comfyui-videohelpersuite`

**Visible output settings:**

- Video combine node: `VHS_VideoCombine`
- Frame rate: `25`
- Format: `video/h264-mp4`
- Pixel format: `yuv420p`
- CRF: `19`
- Metadata saving: enabled
- Trim to audio: enabled

**Before running:**

- Install any missing custom nodes reported by ComfyUI.
- Confirm the workflow points to model files that exist on your machine.
- Check prompt text, input images, audio, save path, and output filename prefix.
- Do a low-resolution or short test run before spending time on a full render.
