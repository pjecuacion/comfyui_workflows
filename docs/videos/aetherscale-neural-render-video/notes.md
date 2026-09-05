# AetherScale Neural Rendering Video

## What this workflow does

This is the smallest valid AetherScale video path around experimental Neural Rendering. It loads source frames, analyzes the required temporal motion, runs the carrier at native 1x, and saves an NVIDIA H.264 MP4 with the source audio and FPS.

It deliberately excludes Restoration, Super Resolution, and HDR. This makes carrier problems easier to isolate, but it does not repair DirectX 12 or carrier-runtime errors.

## Requirements

- ComfyUI on Windows with a supported NVIDIA GPU.
- [ComfyUI-AetherScale](https://github.com/vizart-vj/ComfyUI-AetherScale) 0.9.0 or newer.
- ComfyUI-VideoHelperSuite.
- The AetherScale carrier runtime required by Neural Rendering.

## Use

1. Import `workflows/aetherscale-neural-render-video/aetherscale_neural_render_video.json`.
2. Choose a video in **Load Video (Upload)**.
3. Keep `backend = carrier`, `upscale_mode = native_1x`, and `motion_source = connected_motion` for this isolated path.
4. Run the workflow.

The output is written under `output/AetherScale/` with the `neural_render` prefix.

## Verification status

The JSON structure, live processing-node contracts, source audio/FPS links, frontend graph import, and widget values were verified on 2026-09-05. A render was not queued because ComfyUI already had an active GPU job.
