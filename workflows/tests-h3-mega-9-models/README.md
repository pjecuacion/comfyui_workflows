# H3 mega

Workflows from the Prince Does AI video "H3 mega" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_h3_ref2va_ckpt.json` | MiniMax H3 | seed 42, aspect 16:9, seconds 9.4, unet PRISM_DMAD_PDMD_int8.safetensors, steps 8, sampler euler, scheduler beta, megapixels 1.0 |
| `video_pika_ref2va.json` | pika-ref2va | seed 42, aspect 16:9, seconds 9.4, megapixels 1.0 |
| `video_hyperflow_ref2v.json` | hyperflow-ref2v | seed 42, aspect 16:9, frames 226, width 1344, height 768, steps 6 |
| `video_fasth3_omni.json` | fasth3-omni | seed 42, aspect 16:9, seconds 9.4, megapixels 1.0 |
| `video_fastvideo_vsa4_ref.json` | fastvideo-vsa4-ref | seed 42, aspect 16:9, seconds 9.4, megapixels 1.0 |

## Models you need

- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `minimax_h3_ref2va_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `minimax_h3_ref2v_turbo_8step_v1.0_768p_comfyui_bf16.safetensors`
- `pika_h3_flex_ref2va_v1_bf16.safetensors`
- `minimax_h3_ref2va_hyperflow_flash_14b-int8_convrot.safetensors`
- `minimax_h3_video_vae_fp16.safetensors`
- `fasth3_omniref_8step_pruned_int8_convrot.safetensors`
- `minimax_h3_fastvideo_vsa_datafree_1300step_4step_int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BasicScheduler`, `BlockSparseAttention`, `CLIPLoader`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `HyperFlowLoader`, `HyperFlowSigmas`, `KSamplerSelect`, `LoadImage`, `LoraLoaderModelOnly`, `ManualSigmas`, `MiniMaxH3ReferenceToVideo`, `MiniMaxH3SigmaShift`, `ModelAttentionBackend`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (MiniMax H3): minimax-h3-community-license-agreement (https://huggingface.co/MiniMaxAI/MiniMax-H3/blob/main/LICENSE)
- Model licence (pika-ref2va): other (https://huggingface.co/Pika-Labs/Pika-H3-Flex/blob/main/LICENSE)
- Model licence (hyperflow-ref2v): other (https://huggingface.co/VideoRebirthAI/hyperflow-h3-flash/blob/main/LICENSE)
- Model licence (fasth3-omni): minimax-h3-community-license-agreement (https://huggingface.co/MiniMaxAI/MiniMax-H3/blob/main/LICENSE)
- Model licence (fastvideo-vsa4-ref): not listed

MiniMax H3 is under the MiniMax H3 Community License: its outputs must carry a clear "machine-generated" label, and the licence does not cover every country. Read it before you use the videos.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
