# AetherScale 2x Video Enhancement

## What this workflow does

The workflow loads a video, reduces compression artifacts, analyzes motion, applies experimental temporal Neural Rendering at the original size, upscales frames by 2x, and applies restrained HDR-style polish. It passes the source audio and source FPS to the output video.

## Requirements

- ComfyUI on Windows with a supported NVIDIA GPU.
- ComfyUI-AetherScale 0.8.0 or newer.
- ComfyUI-VideoHelperSuite.
- The AetherScale carrier runtime required by the Neural Rendering node.

## Use

1. Import `workflows/aetherscale-video-enhance-2x/aetherscale_video_enhance_2x.json` into ComfyUI.
2. Use the **Get AetherScale** note if you need to download or update the custom node.
3. Choose a video in **Load Video (Upload)**.
4. Review the output filename and processing settings.
5. Run the workflow.

The default output is an NVIDIA H.264 MP4 under `output/AetherScale/`.

## Verification status

The JSON structure, live node contracts, source audio/FPS links, and frontend-imported widget values were verified on 2026-09-05. A full video render was not run as part of this import-format repair.
