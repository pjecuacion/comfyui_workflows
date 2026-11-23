# pi-H3 (2 steps) vs HyperFlow H3 Flash (6 steps): text to video, 18 hard tests

Workflows from the Prince Does AI video "pi-H3 (2 steps) vs HyperFlow H3 Flash (6 steps): text to video, 18 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_pi_h3_dwd.json` | pi-h3 | seed 42, aspect 16:9, steps 2, seconds 5 |
| `video_hyperflow_t2v.json` | hyperflow-t2v | seed 42, aspect 16:9, steps 6, width 1344, height 768, frames 124 |

## Models you need

- `minimax_h3_fl2va_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `pi_h3_2step_dwd_adapter_int8_convrot.safetensors`
- `pi_h3_4step_dwd_adapter_int8_convrot.safetensors`
- `minimax_h3_fl2va_hyperflow_flash_14b-int8_convrot.safetensors`
- `minimax_h3_video_vae_fp16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BlockSparseAttention`, `CLIPLoader`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `DWD Decode`, `HyperFlowLoader`, `HyperFlowSigmas`, `KSamplerSelect`, `Load LakonLab Adapter`, `MiniMaxH3ImageToVideo`, `MiniMaxH3SigmaShift`, `PrimitiveFloat`, `PrimitiveInt`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAELoader`, `pi-Flow Scheduler`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (hyperflow-t2v): other (https://huggingface.co/VideoRebirthAI/hyperflow-h3-flash/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
