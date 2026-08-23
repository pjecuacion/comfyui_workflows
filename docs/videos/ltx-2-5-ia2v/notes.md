# LTX 2.5 IA2V Workflows

## Included workflows

- `../../../workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_start_frame_upscaled_interpolated.json`
- `../../../workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_first_last_frame_upscaled_interpolated.json`

Both workflows use imported audio instead of an empty generated-audio latent. The audio is trimmed to the requested video duration, encoded with the LTX 2.5 audio VAE, protected with a zero noise mask, and carried through both sampling passes.

## Native LTX 2.5 components retained

- Distilled LTX 2.5 transformer from `models/diffusion_models/`
- Gemma 4 LTX 2.5 text encoder from `models/text_encoders/`
- Separate LTX 2.5 video and audio VAEs from `models/vae/`
- LTX 2.5 latent spatial upscaler from `models/latent_upscale_models/`
- Two sampling passes and tiled video decoding
- RTX video super-resolution at 2x
- RIFE TensorRT interpolation at 2x
- Final output at twice the native model FPS with audio connected

The first/last workflow adds a last-frame guide at frame index `-1` in both sampling passes and crops the low-resolution guide conditioning before the high-resolution pass.

## Crisp Enhance LoRA

Both workflows route the LTX 2.5 transformer through the same model-only LoRA path before either sampling pass:

- Loader: `Power Lora Loader (rgthree)`
- LoRA: `LTX2.3_Crisp_Enhance.safetensors`
- Enabled: yes
- Strength: `1`
- CLIP modification: none

The LoRA-adjusted model is stored with KJNodes `SetNode` and supplied to both `LTXVDualCFGGuider` nodes through matching `GetNode` nodes. This requires `rgthree-comfy` and `ComfyUI-KJNodes` in addition to the existing workflow dependencies.

The supplied LoRA filename identifies it as an LTX 2.3 LoRA while these workflows use an LTX 2.5 transformer. Its local file and graph wiring were verified, but a short real render is still required to confirm runtime compatibility and visual quality.

## Before running

- Update ComfyUI so the native LTX 2.5 and subgraph nodes are available.
- Install `rgthree-comfy` and `ComfyUI-KJNodes`, then place `LTX2.3_Crisp_Enhance.safetensors` in a configured LoRA model folder.
- Install and validate `ComfyUI-Rife-Tensorrt` and `comfyui_nvidia_rtx_nodes`.
- Select your own images, audio, prompt, duration, and output path.
- The prompt enhancer defaults off because its optional encoder is not installed in the checked portable runtime.
- Run a short low-resolution smoke test first. Structural validation does not prove a successful GPU render.
