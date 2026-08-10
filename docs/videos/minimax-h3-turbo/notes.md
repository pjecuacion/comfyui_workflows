# MiniMax H3 Turbo Single-Shot

## Workflow

Open:

`workflows/minimax-h3-turbo/minimax_h3_t2v_turbo_int8_sage_rife48_rtx.json`

This is a separate single-shot workflow. It does not change the multishot workflow.

## First Run

1. Fully restart ComfyUI so the new Turbo nodes register.
2. Load the workflow above.
3. Set the prompt, aspect ratio, megapixels, and duration in the input section.
4. Keep `BasicScheduler` on `simple` with `steps = 6`.
5. Keep the Turbo LoRA strength at `1.0`.
6. Queue the workflow.

The final video is saved under `output/video/` with the prefix `MiniMax_H3_Turbo_Upscaled_48fps`.

## Installed Models

- Diffusion model: `minimax_h3_fl2va_pruned_int8_convrot.safetensors`
- Text encoder: `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- Video VAE: `minimax_h3_video_vae_fp16.safetensors`
- Audio VAE: `minimax_h3_audio_vae_fp32.safetensors`
- Turbo LoRA: `minimax_h3_turbo_4step_ckpt500.safetensors`

The workflow uses the pruned INT8 diffusion model already proven in this portable ComfyUI installation. Current Turbo nodes support pruned MiniMax bases by restoring the LoRA time-conditioning at runtime.

## FPS and Duration

MiniMax generates at 24 FPS. RIFE inserts one frame between each pair of generated frames, producing 48 FPS. `CreateVideo` is explicitly set to 48 FPS, so playback duration stays effectively unchanged.

The processing paths are:

`24 FPS decode -> RIFE 2x -> RTX 4x upscale -> CreateVideo at 48 FPS`

`audio decode -> finite-value guard -> CreateVideo`

The audio guard prevents rare NaN or infinity samples from crashing AAC encoding. Normal audio samples are unchanged.

Do not add `Patch SageAttention KJ` to this workflow when ComfyUI already starts with `--use-sage-attention`. Applying a second model-level attention patch can make Turbo output numerically invalid.

Changing only the final FPS without matching the frame multiplier will change playback speed. Changing the RIFE multiplier without updating the final FPS can also change duration.

## Performance

RIFE runs before the 4x RTX upscale, so interpolation works on smaller frames and is much faster than interpolating the upscaled frames. Disable RIFE or RTX upscale if you need a faster preview.

The author describes 6-8 steps as the comfort range for this checkpoint. This workflow uses 6 steps for speed while avoiding the softer result often seen at 4 steps.

## Source Copy

The unchanged author example is preserved at:

`workflows/minimax-h3-turbo/upstream/minimax_h3_t2v_turbo.json`
