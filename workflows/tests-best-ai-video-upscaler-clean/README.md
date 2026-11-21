# Best AI Video Upscaler in ComfyUI: SeedVR2 vs RelayVSR vs ReCaVSR vs NVIDIA RTX VSR (all 2x, with an answer key)

Workflows from the Prince Does AI video "Best AI Video Upscaler in ComfyUI: SeedVR2 vs RelayVSR vs ReCaVSR vs NVIDIA RTX VSR (all 2x, with an answer key)" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_seedvr2_upscale.json` | seedvr2-upscale-video | seed 20261120, aspect 16:9, scale 2 |
| `video_relayvsr_x2_upscale.json` | relayvsr-upscale-video | seed 20261120, aspect 16:9 |
| `video_recavsr_x4_upscale.json` | recavsr-upscale-video | seed 20261120, aspect 16:9, scale 2 |

## Models you need

- `seedvr2_ema_vae_fp16.safetensors`
- `seedvr2_3b_int8_convrot.safetensors`
- `relayvsr_x2_lightx2v_int8_convrot.safetensors`
- `relayvsr_flash_vae_x2_fp32.safetensors`
- `transformer_int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`ComfySwitchNode`, `CreateVideo`, `GetVideoComponents`, `KSampler`, `LoadVideo`, `PrimitiveBoolean`, `ReCaVSRLoader`, `ReCaVSRUpscale`, `RelayVSRConditioning`, `ResizeImageMaskNode`, `SaveVideo`, `SeedVR2Conditioning`, `SeedVR2PostProcessing`, `SeedVR2Preprocess`, `SeedVR2TemporalChunk`, `SeedVR2TemporalMerge`, `UNETLoader`, `VAEDecodeTiled`, `VAEEncodeTiled`, `VAELoader`, `VSRDecode`, `Video Slice`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (seedvr2-upscale-video): apache-2.0 (https://huggingface.co/ByteDance-Seed/SeedVR2-3B)
- Model licence (relayvsr-upscale-video): apache-2.0 (https://huggingface.co/Comfy-Org/RelayVSR)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
