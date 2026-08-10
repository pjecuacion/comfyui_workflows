# MiniMax H3 Multishot

## Recommended Workflow

Open:

`workflows/minimax-h3-multishot/H3_Multishot_AIO_local-safetensors.json`

This local copy selects the MiniMax H3 FP8 model, NVFP4 text encoder, and video/audio VAEs already installed in the portable ComfyUI instance.

## First Run

1. Fully restart ComfyUI so the new `ComfyUI-H3-Multishot` nodes register.
2. Load the local AIO workflow.
3. For text-to-video, turn off `H3 Optional Image`.
4. For image-to-video, choose an image in `Load Image` and enable `H3 Optional Image`.
5. In `H3 Multishot Sampler`, write one complete prompt per shot.
6. Put `---` on its own line between shots.
7. Leave `shot_count` at `0` to render one shot per prompt, or set `1-8` to force a count.
8. Queue the workflow. The master is saved under `output/video/H3MULTI/`.

## Timing

- `243` frames per shot is approximately 10.1 seconds at 24 FPS.
- `362` frames per shot is approximately 15.1 seconds at 24 FPS.
- Each later shot starts from the previous shot's final frame.
- The sampler removes the duplicated seam frame and its matching audio automatically.

For three shots at 243 frames, expect approximately 30.3 seconds total, minus the two one-frame seams.

## Prompt Pattern

Repeat identity, clothing, location, lighting, voice, and camera details in every shot prompt. End each shot in a composition that the next shot can plausibly continue from.

```text
Shot-one visual description, action, dialogue, and audio.
---
Same character and setting, next action, dialogue, and audio.
---
Same character and setting, final action, dialogue, and audio.
```

## Other Included Workflows

- `upstream/H3_Multishot_MEMORY.json`: long-form identity memory for roughly 2-5 minute projects.
- `upstream/H3_Keyframes.json`: image anchors at positions such as `0%, 50%, 100%` within one generation.

The upstream files are preserved unchanged. They default to GGUF model names; select installed safetensors manually if using them.
