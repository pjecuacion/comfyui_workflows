# MiniMax H3 Multishot Turbo: 15 hard tests

Workflows from the Prince Does AI video "MiniMax H3 Multishot Turbo: 15 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_h3_multishot_turbo.json` | MiniMax H3 | seed 42, width 960, height 544, steps 4 |

## Models you need

- `minimax_h3_fl2va_pruned_int8_convrot.safetensors`
- `minimax_h3_video_vae_fp16.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `minimax_h3_turbo_4step_ckpt500.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CreateVideo`, `H3ClipLoaderAny`, `H3ModelLoaderAny`, `H3MultishotSampler`, `H3OptionalImage`, `LoadImage`, `MiniMaxH3TurboLoRA`, `SaveVideo`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

MiniMax H3 is under the MiniMax H3 Community License: its outputs must carry a clear "machine-generated" label, and the licence does not cover every country. Read it before you use the videos.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
