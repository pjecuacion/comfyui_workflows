# FastH3 Omni: 10 hard tests + 8 styles

Workflows from the Prince Does AI video "FastH3 Omni: 10 hard tests + 8 styles" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_fasth3_omni.json` | fasth3-omni | seed 20261021, aspect 16:9, seconds 5 |

## Models you need

- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `fasth3_omniref_8step_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BasicScheduler`, `BlockSparseAttention`, `CLIPLoader`, `ComfyMathExpression`, `CreateVideo`, `KSamplerSelect`, `LoadImage`, `MiniMaxH3ReferenceToVideo`, `MiniMaxH3SigmaShift`, `ModelAttentionBackend`, `PrimitiveFloat`, `PrimitiveStringMultiline`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: MiniMax-H3 Community License (https://huggingface.co/FastVideo/FastH3-Omni-Comfy)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
