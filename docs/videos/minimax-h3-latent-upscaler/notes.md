# MiniMax H3 Latent Upscaler - Exact Reference Audio

## Workflow

`workflows/minimax-h3-latent-upscaler/minimax_h3_r2v_latent_upscaler_exact_ref_audio.json`

This is a repaired sibling of the supplied reference-to-video latent-upscaler workflow. It keeps the original graph design, including two-stage latent upscaling, while treating the selected `LoadAudio` clip as the intended spoken soundtrack.

## Audio Path

The single `LoadAudio` output is connected three times:

1. To `ref_audio_0` on `MiniMaxH3ReferenceToVideo` so H3 sees `<Audio 1>` as a reference.
2. To `MiniMaxH3AddGuide` at frame `0`, which makes the clip a speech-timing and lip-sync guide for both sampling stages.
3. To `CreateVideo`, so the saved MP4 contains the exact selected clip instead of newly decoded model audio.

The prior generated-audio decode node remains in the graph for comparison but is no longer sent to `CreateVideo`.

## Use

1. Put the audio file in ComfyUI's `input/` folder, then select it in `LoadAudio`.
2. Select the presenter image in `LoadImage` and replace the prompt as needed. Keep the `<Audio 1>` instruction when you want the clip's dialogue and timing to drive the result.
3. Set the duration to match the clip. H3 uses 24 FPS and valid output counts follow `17k + 5`: 124 frames is about 5.17 seconds, 243 is about 10.13 seconds, and 362 is about 15.08 seconds.
4. Queue the workflow and listen to the saved MP4. It should contain the selected source audio exactly.

## Requirements

- ComfyUI with the built-in `MiniMaxH3ReferenceToVideo` and `MiniMaxH3AddGuide` nodes.
- MiniMax H3 video and audio VAEs, model, text encoder, and Turbo LoRA named in the workflow.
- The selected audio must be appropriate for the chosen rendered duration.

## Verification Status

The graph has deterministic JSON and link-integrity validation, including a regression test that proves the source audio feeds H3 reference conditioning, the timing guide, and final export. A full GPU render was not performed as part of this repair.
