# MiniMax H3: with vs without the AnimateDiff Style LoRA

Workflows from the Prince Does AI video "MiniMax H3: with vs without the AnimateDiff Style LoRA" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_h3_t2v_lora.json` | MiniMax H3 | seed 20261015, aspect 16:9 |

## Models you need

- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `fastvideo_fasth3_8step_v2_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `set-lora-by-recipe.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BasicScheduler`, `BlockSparseAttention`, `CLIPLoader`, `ComfyMathExpression`, `CreateVideo`, `KSamplerSelect`, `LoraLoaderModelOnly`, `MiniMaxH3ImageToVideo`, `MiniMaxH3SigmaShift`, `ModelAttentionBackend`, `PrimitiveFloat`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

MiniMax H3 is under the MiniMax H3 Community License: its outputs must carry a clear "machine-generated" label, and the licence does not cover every country. Read it before you use the videos.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
