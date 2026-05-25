# Workflow Catalog

This page tracks the workflows currently shared in this repo.

## LTX 2.3 Image/Text-to-Video Claymation Demo

**File:** `video_ltx2_3_it2v - prince does ai - claymation demo.json`

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

