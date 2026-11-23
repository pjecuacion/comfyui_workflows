# Best AI Image Editor Rematch: Qwen Edit 2511 vs MiniMax H3 Image Edit vs FLUX 3 Klein Distilled Edit, 15 Hard Edits

Workflows from the Prince Does AI video "Best AI Image Editor Rematch: Qwen Edit 2511 vs MiniMax H3 Image Edit vs FLUX 3 Klein Distilled Edit, 15 Hard Edits" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_qwen_edit_2511.json` | qwen-edit-2511 | seed 20261124 |
| `image_minimax_h3_image_edit.json` | MiniMax H3 | seed 20261124, enhance False, megapixels 1 |
| `image_flux3_klein_distilled_edit.json` | FLUX 3 Image Klein | seed 20261124, enhance False, megapixels 1 |

## Models you need

- `qwen_image_vae.safetensors`
- `Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors`
- `qwen_image_edit_2511_int8_convrot.safetensors`
- `qwen_2.5_vl_7b_fp8_scaled.safetensors`
- `minimax_h3_image_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_int8_convrot.safetensors`
- `minimax_h3_image_vae_fp16.safetensors`
- `qwen3.5_9b_w4a8_gptq.safetensors`
- `flux3-image-klein-int8-convrot.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `flux2-vae.safetensors`
- `qwen3.5_9b_flux3_prompt_upsampler_w4a8.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BatchImagesNode`, `CFGNorm`, `CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `Flux3LayoutPrompt`, `FluxKontextImageScale`, `FluxKontextMultiReferenceLatentMethod`, `GetImageSize`, `ImageCompare`, `JsonExtractString`, `KSampler`, `LoadImage`, `LoraLoaderModelOnly`, `MiniMaxH3ImageConditioning`, `ModelSamplingAuraFlow`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `ReferenceMultiLatent`, `ResizeImageMaskNode`, `SaveImage`, `SaveImageAdvanced`, `StringReplace`, `TextEncodeQwenImageEditPlus`, `TextGenerate`, `TextGenerateV2`, `UNETLoader`, `VAEDecode`, `VAEEncode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (qwen-edit-2511): apache-2.0 (https://huggingface.co/Qwen/Qwen-Image-Edit-2511)
- Model licence (MiniMax H3): other (https://huggingface.co/MiniMaxAI/MiniMax-H3-Image/blob/main/LICENSE)

MiniMax H3 is under the MiniMax H3 Community License: its outputs must carry a clear "machine-generated" label, and the licence does not cover every country. Read it before you use the videos.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
