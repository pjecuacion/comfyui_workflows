# I Tested P-H3-Image: 30 Hard Tests

Workflows from the Prince Does AI video "I Tested P-H3-Image: 30 Hard Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_p_h3_image.json` | p-h3-image | seed 20261106, aspect 16:9 |

## Models you need

- `minimax_h3_fl2va_pruned_int8_convrot.safetensors`
- `p-h3-image_text_encoder_int8_convrot.safetensors`
- `p-h3-image_lora_bf16.safetensors`
- `p-h3-image_vae_int8_convrot.safetensors`
- `p-h3-image_prompt_upsampler_w4a8.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `CLIPLoader`, `ComfySwitchNode`, `KSamplerSelect`, `LoraLoaderModelOnly`, `ManualSigmas`, `MiniMaxH3SigmaShift`, `PH3ImageConditioning`, `PreviewAny`, `PrimitiveStringMultiline`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveImage`, `TextGenerateV2`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: other (https://huggingface.co/MiniMaxAI/MiniMax-H3/blob/main/LICENSE)
- Model licence: other (https://huggingface.co/Pika-Labs/Pika-H3-Flex/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
