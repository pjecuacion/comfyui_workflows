# FastH3 Omni vs FastVideo VSA 4-step: 18 same tests

Workflows from the Prince Does AI video "FastH3 Omni vs FastVideo VSA 4-step: 18 same tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_fastvideo_vsa4_ref.json` | fastvideo-vsa4-ref | seed 20261021, aspect 16:9 |

## Models you need

- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `minimax_h3_fastvideo_vsa_datafree_1300step_4step_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `minimax_h3_ref2v_turbo_8step_v1.0_768p_comfyui_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BasicScheduler`, `CLIPLoader`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `KSamplerSelect`, `LoadImage`, `LoraLoaderModelOnly`, `MiniMaxH3ReferenceToVideo`, `ModelAttentionBackend`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: MiniMax-H3 Community License (https://huggingface.co/FastVideo/FastH3-Omni-Comfy)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
