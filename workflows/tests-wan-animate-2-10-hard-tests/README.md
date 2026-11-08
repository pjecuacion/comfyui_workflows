# Wan Animate 2: 10 hard character-animation tests

Workflows from the Prince Does AI video "Wan Animate 2: 10 hard character-animation tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_wan_animate2.json` | wan-animate2 | seed 42, frames 81 |

## Models you need

- `wan_animate_2_distill_int8_convrot.safetensors`
- `umt5_xxl_fp8_e4m3fn_scaled.safetensors`
- `clip_vision_h.safetensors`
- `Wan2_1_VAE_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicScheduler`, `BatchImagesNode`, `CLIPLoader`, `CLIPTextEncode`, `CLIPVisionEncode`, `CLIPVisionLoader`, `ComfyMathExpression`, `ComfySwitchNode`, `ContextWindowsManual`, `CreateVideo`, `GetImageSize`, `GetVideoComponents`, `ImageFromBatch`, `ImageStitch`, `KSamplerSelect`, `LoadImage`, `LoadVideo`, `ModelSamplingSD3`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveStringMultiline`, `ResizeImageMaskNode`, `SamplerCustom`, `SaveVideo`, `TrimVideoLatent`, `UNETLoader`, `VAEDecode`, `VAELoader`, `WanAnimate2Cache`, `WanAnimate2ToVideo`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: apache-2.0 (https://huggingface.co/Wan-AI/Wan2.2-Animate-2-14B)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
