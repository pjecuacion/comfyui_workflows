# Workflow Catalog

This catalog lists every `*.json` workflow under `workflows/`, including the
upstream/reference workflows kept for comparison. Last checked: 2026-09-17.

Workflow JSON files are ComfyUI graphs. Check each graph's model names, custom
node requirements, input media, prompts, output path, and video settings before
running it. A JSON file being present or structurally valid is not proof that it
will run in a different ComfyUI installation.

## LTX workflows

| Bundle | Workflow | Purpose |
| --- | --- | --- |
| LTX 2.3 claymation demo | `workflows/ltx-2-3-claymation-demo/video_ltx2_3_it2v_prince-does-ai-claymation-demo.json` | LTX 2.3 image/text-to-video claymation-style demo. Uses Video Helper Suite for H.264 MP4 output. |
| LTX 2.3 CozyFelt LoRA | `workflows/ltx-2-3-cozyfelt-lora/CozyFeltLora_ltx2_3_it2v - prince does ai demo.json` | LTX 2.3 image/text-to-video demo using the CozyFelt LoRA. |
| LTX 2.3 IA2V, start frame | `workflows/ltx-2-3-ia2v-start-frame/video_ltx2_3_ia2v_start_frame.json` | Dedicated image-and-audio-to-video graph guided by a start image. |
| LTX 2.3 IA2V, start/middle/last | `workflows/ltx-2-3-ia2v-start-middle-last-frame/video_ltx2_3_ia2v_start_middle_last_frame.json` | Dedicated image-and-audio-to-video graph guided by start, middle, and last images. |
| LTX 2.5 IA2V, start frame | `workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_start_frame_upscaled_interpolated.json` | Start-image IA2V with imported audio, Crisp Enhance LoRA, latent upscale, RTX 2x, and RIFE 2x output interpolation. |
| LTX 2.5 IA2V, first/last frame | `workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_first_last_frame_upscaled_interpolated.json` | First-and-last-image IA2V counterpart with the same imported-audio and upscale/interpolation path. |
| LTX 2 camera-control LoRAs | `workflows/ltx-2-camera-control-loras/video_ltx2_3_ia2v_working.json` | LTX 2.3 IA2V workflow for testing jib and dolly camera-control LoRAs. See `docs/videos/ltx-2-camera-control-loras/`. |
| LTX 2.3 IA2V, last frame | `workflows/ltx2.3 ia2v-lastframe/video_ltx2.3_ia2v - working organized + last frame.json` | Organised LTX 2.3 IA2V graph with last-frame guidance. |
| LTX 2.3 clean plate LoRA | `workflows/ltx2.3-clean-plate-lora/ltx2.3-clean-plate-lora-silent-video-safe.json` | Silent-video-safe clean-plate LoRA variant; uses an empty latent-audio path when source audio is absent. |
| LTX 2.3 IA2V legacy variants | `workflows/ltx2.3.ia2v-start-middle-lastframe/video_ltx2.3_ia2v - organized.json` | Organised LTX 2.3 IA2V start-frame variant retained as an earlier workflow. |
| LTX 2.3 IA2V legacy variants | `workflows/ltx2.3.ia2v-start-middle-lastframe/video_ltx2.3_ia2v-with-middle-frame.json` | Organised LTX 2.3 IA2V start/middle/last-frame variant retained as an earlier workflow. |

## MiniMax H3 workflows

| Bundle | Workflow | Purpose |
| --- | --- | --- |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_t2v fp8.json` | Base FP8 text-to-video graph. |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_i2v fp8.json` | FP8 image-to-video graph. |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_t2v fp8 sageattention rtx upscaled interpolated.json` | FP8 text-to-video with SageAttention, RTX upscale, and duration-safe RIFE interpolation. |
| MiniMax H3 Turbo | `workflows/minimax-h3-turbo/minimax_h3_t2v_turbo_int8_sage_rife48_rtx.json` | Local INT8 Turbo text-to-video graph with SageAttention, RIFE 2x, RTX upscale, and 48 FPS output. |
| MiniMax H3 Turbo upstream | `workflows/minimax-h3-turbo/upstream/minimax_h3_t2v_turbo.json` | Unmodified upstream Turbo reference workflow. |
| MiniMax H3 multishot | `workflows/minimax-h3-multishot/H3_Multishot_AIO_local-safetensors.json` | Local-ready all-in-one multishot workflow configured for local safetensors models. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Multishot_AIO.json` | Unmodified upstream all-in-one multishot workflow. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Multishot_MEMORY.json` | Unmodified upstream memory-oriented multishot workflow for longer projects. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Keyframes.json` | Unmodified upstream keyframes workflow. |
| MiniMax H3 multishot Turbo | `workflows/minimax-h3-multishot-turbo/H3_Multishot_Turbo_AIO_local-safetensors.json` | Local-safetensors multishot workflow with the opt-in Turbo sampling path. |
| MiniMax H3 face refine | `workflows/minimax-h3-fast-loras-face-refine/minimax_h3_fast_loras_face_refine.json` | Fast LoRA reference-to-video sibling with a single-face refinement pass before RTX/RIFE processing. |
| MiniMax H3 latent upscaler | `workflows/minimax-h3-latent-upscaler/minimax_h3_r2v_latent_upscaler_voice_reference_audio.json` | Reference-to-video latent-upscaler with the selected audio used as an H3 voice-timbre and delivery reference. |
| MiniMax H3 latent upscaler | `workflows/minimax-h3-latent-upscaler/minimax_h3_r2v_latent_upscaler_voice_reference_audio_preserved.json` | Latent-upscaled counterpart that retains first-pass reference-conditioned generated audio while using second-pass upscaled video. |
| MiniMax H3 T2V variants | `workflows/minimax-h3-t2v-11-variants/video_minimax_h3_t2v Prince Does AI Demo.json` | T2V demo graph containing multiple configured variants. |
| MiniMax H3 realistic quiz | `workflows/minimax-h3-realistic-quiz-prince/realistic_quiz_prince_scene_01_canvas_grouped.json` | Grouped canvas export for realistic quiz scene 01. |
| MiniMax H3 realistic quiz | `workflows/minimax-h3-realistic-quiz-prince/realistic_quiz_prince_scene_02_canvas_grouped.json` | Grouped canvas export for realistic quiz scene 02. |

## MiniMax H3 caption-scene exports

These submitted workflow exports form one six-scene text-pop caption sequence.

| Scene | Workflow |
| --- | --- |
| 01 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_01_submitted_workflow.json` |
| 02 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_02_submitted_workflow.json` |
| 03 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_03_submitted_workflow.json` |
| 04 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_04_submitted_workflow.json` |
| 05 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_05_submitted_workflow.json` |
| 06 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_06_submitted_workflow.json` |

## Enhancement workflows

| Bundle | Workflow | Purpose |
| --- | --- | --- |
| FlashVSR | `workflows/flashvsr/FlashVSR-v1.1-ready.json` | FlashVSR v1.1 video-restoration/upscaling workflow prepared for local use. |
| AetherScale face detail | `workflows/aetherscale-face-detail-video/aetherscale_face_detail_video.json` | AetherScale video face-detail workflow. |
| AetherScale neural render | `workflows/aetherscale-neural-render-video/aetherscale_neural_render_video.json` | AetherScale neural-render video workflow. |
| AetherScale 2x enhancement | `workflows/aetherscale-video-enhance-2x/aetherscale_video_enhance_2x.json` | AetherScale 2x video-enhancement workflow. |

### Submitted multi-scene workflow bundles

The following bundles contain scene exports. Every file below is a separate
ComfyUI workflow JSON.

| Bundle | Scene exports |
| --- | --- |
| FastVideo H3 Rick and Morty demo, episode 1 | `workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_01_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_02_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_03_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_04_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_05_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_06_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_07_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_08_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 1/rick_and_morty_book_scene_09_submitted_workflow.json` |
| FastVideo H3 Rick and Morty demo, episode 2 | `workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_01_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_02_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_03_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_04_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_05_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_06_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_07_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_08_submitted_workflow.json`<br>`workflows/fastvideo-h3-rm-demo/rm episode 2/rick_and_morty_fastvideo_scene_09_submitted_workflow.json` |
| Kijai H3 FastVideo VSA example 1 | `workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 1/swot_analysis_sample_h3_fast_int8_scene_01_submitted_workflow.json`<br>`workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 1/swot_analysis_sample_h3_fast_int8_scene_02_submitted_workflow.json`<br>`workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 1/swot_analysis_sample_h3_fast_int8_scene_03_submitted_workflow.json` |
| Kijai H3 FastVideo VSA example 2 | `workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 2/swot_analysis_sample_fp8_scene_01_submitted_workflow.json`<br>`workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 2/swot_analysis_sample_fp8_scene_02_submitted_workflow.json`<br>`workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 2/swot_analysis_sample_fp8_scene_03_submitted_workflow.json` |
| Kijai H3 FastVideo VSA example 3 | `workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 3/h3_fast_no_lightning_lora_scene_01_submitted_workflow.json`<br>`workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 3/h3_fast_no_lightning_lora_scene_02_submitted_workflow.json`<br>`workflows/minimax-h3-kijai-h3-fastvide-vsa-3-examples/example 3/h3_fast_no_lightning_lora_scene_03_submitted_workflow.json` |
| Story Studio: How Does Google Work? | `workflows/minimax-h3-storystudio-SQL and Google Demo/how_does_google_work_scene_01_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/how_does_google_work_scene_02_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/how_does_google_work_scene_03_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/how_does_google_work_scene_04_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/how_does_google_work_scene_05_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/how_does_google_work_scene_06_submitted_workflow.json` |
| Story Studio: SQL example | `workflows/minimax-h3-storystudio-SQL and Google Demo/prince_does_ai_sql_example_scene_01_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/prince_does_ai_sql_example_scene_02_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/prince_does_ai_sql_example_scene_03_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/prince_does_ai_sql_example_scene_04_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/prince_does_ai_sql_example_scene_05_submitted_workflow.json`<br>`workflows/minimax-h3-storystudio-SQL and Google Demo/prince_does_ai_sql_example_scene_06_submitted_workflow.json` |
| Taomate 3-step, anime example | `workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_base.json`<br>`workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_profile_2.json`<br>`workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_profile_3.json`<br>`workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_profile_4.json`<br>`workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_profile_5.json` |
| Taomate 3-step, realism example | `workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_base.json`<br>`workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_profile_2.json`<br>`workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_profile_3.json`<br>`workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_profile_4.json`<br>`workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_profile_5.json` |

## Related notes

- `docs/videos/ltx-2-3-ia2v-start-frame/notes.md`
- `docs/videos/ltx-2-3-ia2v-start-middle-last-frame/notes.md`
- `docs/videos/ltx-2-5-ia2v/notes.md`
- `docs/videos/ltx-2-camera-control-loras/notes.md` and `prompts.md`
- `docs/videos/minimax-h3-turbo/notes.md`
- `docs/videos/minimax-h3-multishot/notes.md`
- `docs/videos/minimax-h3-latent-upscaler/notes.md`
