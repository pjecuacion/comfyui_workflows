# I Tested Ming Image Edit: 20 Hard Design Edits

Workflows from the Prince Does AI video "I Tested Ming Image Edit: 20 Hard Design Edits" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_ming_edit.json` | ming-edit | seed 20261108 |

## Models you need

- `ming_image_0.1_design_int8_convrot.safetensors`
- `ming_image_vae_bf16.safetensors`
- `ming_image_0.1_ling_mini_2.0_int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BasicScheduler`, `BuildJsonPromptIdeogram`, `CLIPLoader`, `ComfyMathExpression`, `ComfyNumberConvert`, `ConvertArrayToString`, `ConvertDictionaryToString`, `CreateBoundingBoxes`, `CreateList`, `EmptyLatentImage`, `EndLoop`, `GetImageSize`, `GetItemFromList`, `ImageStitch`, `LoadImage`, `ModelAttentionBackend`, `ModelSamplingFlux`, `PreviewAny`, `PreviewImage`, `PrimitiveInt`, `RandomNoise`, `RegexExtract`, `RegexReplace`, `SamplerCustomAdvanced`, `SamplerLCM`, `SaveImageAdvanced`, `StartLoop`, `StringFormat`, `StringLength`, `TextEncodeMingImageEdit`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: mit (https://huggingface.co/inclusionAI/Ming-Image-0.1-Design)
- Model licence: mit

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
