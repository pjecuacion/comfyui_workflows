# LTX 2 Camera-Control LoRAs

## Files

- Workflow: `../../../workflows/ltx-2-camera-control-loras/video_ltx2_3_ia2v_working.json`
- Prompts: `prompts.md`

## LoRA Source

The camera-control LoRAs used for this video come from the Lightricks LTX-2 collection on Hugging Face:

- https://huggingface.co/collections/Lightricks/ltx-2

Camera-control LoRAs referenced in this bundle:

- `LTX-2-19b-LoRA-Camera-Control-Jib-Up`
- `LTX-2-19b-LoRA-Camera-Control-Jib-Down`
- `LTX-2-19b-LoRA-Camera-Control-Dolly-Left`
- `LTX-2-19b-LoRA-Camera-Control-Dolly-Right`
- `LTX-2-19b-LoRA-Camera-Control-Dolly-In`
- `LTX-2-19b-LoRA-Camera-Control-Dolly-Out`

## Purpose

This bundle supports the YouTube video about LTX 2 camera-control LoRAs. It groups the workflow JSON and prompt reference material so viewers can reproduce or adapt the camera movement tests.

## Before Running

- Install any missing ComfyUI custom nodes reported when loading the workflow.
- Add the required LTX model files and camera-control LoRA files to your local ComfyUI model folders.
- Use the Lightricks Hugging Face collection above as the source for the LoRA files.
- Check all local input paths and output paths before rendering.
- Run a short test first to confirm the LoRA strength, framing, and motion direction.
