# MiniMax H3 Latent Upscaler - Voice Reference Audio

## Workflow

`workflows/minimax-h3-latent-upscaler/minimax_h3_r2v_latent_upscaler_voice_reference_audio.json`

This is a repository copy of the supplied reference-to-video latent-upscaler workflow. It keeps the original graph design, including two-stage latent upscaling, and uses the selected `LoadAudio` clip only as a voice reference.

## Audio Path

The selected `LoadAudio` output is connected to `ref_audio_0` on `MiniMaxH3ReferenceToVideo`.

`<Audio 1>` provides voice timbre and delivery reference only. H3 generates the final spoken audio from the prompt's tagged dialogue, then `VAEDecodeAudio` sends that generated audio to `CreateVideo`.

## Use

1. Put the audio file in ComfyUI's `input/` folder, then select it in `LoadAudio`.
2. Select the presenter image in `LoadImage` and enter the desired tagged dialogue in the prompt. Keep `<Audio 1>` as the voice-timbre and delivery reference.
3. Set duration for the generated dialogue. H3 uses 24 FPS and valid output counts follow `17k + 5`: 124 frames is about 5.17 seconds, 243 is about 10.13 seconds, and 362 is about 15.08 seconds.
4. Queue the workflow. The saved MP4 contains H3's generated audio, not the reference clip.

## Requirements

- ComfyUI with the built-in `MiniMaxH3ReferenceToVideo` node.
- MiniMax H3 video and audio VAEs, model, text encoder, and Turbo LoRA named in the workflow.
- A clear speech sample is preferable for voice-timbre and delivery reference. Its duration does not determine the rendered clip duration.

## Verification Status

The graph has deterministic validation that proves the source audio only feeds H3 reference conditioning and that generated H3 audio is exported. A full GPU render was not performed as part of this documentation correction.
