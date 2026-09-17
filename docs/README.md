# ComfyUI Workflows

A public collection of ComfyUI workflows that I share, test, and improve over
time. The current focus is video and image-to-video workflows.

## Workflow catalog

This README lists every workflow JSON currently under `workflows/`, including
the upstream/reference graphs retained for comparison. For extra workflow
details, see [the detailed catalog](workflows.md).

| Bundle | Workflow | What it is |
| --- | --- | --- |
| LTX 2.3 claymation demo | `workflows/ltx-2-3-claymation-demo/video_ltx2_3_it2v_prince-does-ai-claymation-demo.json` | LTX 2.3 image/text-to-video claymation-style demo. |
| LTX 2.3 CozyFelt LoRA | `workflows/ltx-2-3-cozyfelt-lora/CozyFeltLora_ltx2_3_it2v - prince does ai demo.json` | LTX 2.3 image/text-to-video demo using the CozyFelt LoRA. |
| LTX 2.3 IA2V | `workflows/ltx-2-3-ia2v-start-frame/video_ltx2_3_ia2v_start_frame.json` | Imported-audio workflow guided by a start frame. |
| LTX 2.3 IA2V | `workflows/ltx-2-3-ia2v-start-middle-last-frame/video_ltx2_3_ia2v_start_middle_last_frame.json` | Imported-audio workflow guided by start, middle, and last frames. |
| LTX 2.5 IA2V | `workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_start_frame_upscaled_interpolated.json` | Start-frame IA2V with imported audio, RTX 2x, and RIFE 2x. |
| LTX 2.5 IA2V | `workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_first_last_frame_upscaled_interpolated.json` | First/last-frame IA2V with imported audio, RTX 2x, and RIFE 2x. |
| LTX 2 camera-control LoRAs | `workflows/ltx-2-camera-control-loras/video_ltx2_3_ia2v_working.json` | LTX 2.3 IA2V graph for jib and dolly LoRA tests. |
| LTX 2.3 IA2V last frame | `workflows/ltx2.3 ia2v-lastframe/video_ltx2.3_ia2v - working organized + last frame.json` | Organised LTX 2.3 graph with last-frame guidance. |
| LTX 2.3 clean plate LoRA | `workflows/ltx2.3-clean-plate-lora/ltx2.3-clean-plate-lora-silent-video-safe.json` | Silent-video-safe clean-plate LoRA variant. |
| LTX 2.3 IA2V legacy | `workflows/ltx2.3.ia2v-start-middle-lastframe/video_ltx2.3_ia2v - organized.json` | Earlier organised start-frame variant. |
| LTX 2.3 IA2V legacy | `workflows/ltx2.3.ia2v-start-middle-lastframe/video_ltx2.3_ia2v-with-middle-frame.json` | Earlier organised start/middle/last-frame variant. |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_t2v fp8.json` | Base FP8 text-to-video graph. |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_i2v fp8.json` | FP8 image-to-video graph. |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_t2v fp8 sageattention rtx upscaled interpolated.json` | Text-to-video with SageAttention, RTX, and RIFE. |
| MiniMax H3 Turbo | `workflows/minimax-h3-turbo/minimax_h3_t2v_turbo_int8_sage_rife48_rtx.json` | Local INT8 Turbo graph with SageAttention, RIFE, RTX, and 48 FPS output. |
| MiniMax H3 Turbo upstream | `workflows/minimax-h3-turbo/upstream/minimax_h3_t2v_turbo.json` | Unmodified upstream Turbo reference graph. |
| MiniMax H3 multishot | `workflows/minimax-h3-multishot/H3_Multishot_AIO_local-safetensors.json` | Local-ready all-in-one multishot graph. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Multishot_AIO.json` | Unmodified upstream all-in-one graph. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Multishot_MEMORY.json` | Unmodified upstream memory-oriented graph. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Keyframes.json` | Unmodified upstream keyframes graph. |
| MiniMax H3 multishot Turbo | `workflows/minimax-h3-multishot-turbo/H3_Multishot_Turbo_AIO_local-safetensors.json` | Local-safetensors graph with opt-in Turbo sampling. |
| MiniMax H3 face refine | `workflows/minimax-h3-fast-loras-face-refine/minimax_h3_fast_loras_face_refine.json` | Fast LoRA reference-to-video with a single-face refinement pass. |
| MiniMax H3 latent upscaler | `workflows/minimax-h3-latent-upscaler/minimax_h3_r2v_latent_upscaler_voice_reference_audio.json` | Reference-to-video latent upscaler with source audio used as a voice reference. |
| MiniMax H3 latent upscaler | `workflows/minimax-h3-latent-upscaler/minimax_h3_r2v_latent_upscaler_voice_reference_audio_preserved.json` | Latent-upscaled reference-to-video variant that preserves first-pass generated audio. |
| MiniMax H3 T2V variants | `workflows/minimax-h3-t2v-11-variants/video_minimax_h3_t2v Prince Does AI Demo.json` | T2V demo graph containing multiple configured variants. |
| MiniMax H3 caption scene 01 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_01_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 02 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_02_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 03 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_03_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 04 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_04_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 05 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_05_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 06 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_06_submitted_workflow.json` | Submitted text-pop caption scene export. |
| FlashVSR | `workflows/flashvsr/FlashVSR-v1.1-ready.json` | FlashVSR v1.1 video-restoration/upscaling graph. |
| AetherScale face detail | `workflows/aetherscale-face-detail-video/aetherscale_face_detail_video.json` | AetherScale video face-detail workflow. |
| AetherScale neural render | `workflows/aetherscale-neural-render-video/aetherscale_neural_render_video.json` | AetherScale neural-render video workflow. |
| AetherScale 2x enhancement | `workflows/aetherscale-video-enhance-2x/aetherscale_video_enhance_2x.json` | AetherScale 2x video-enhancement workflow. |
| MiniMax H3 realistic quiz | `workflows/minimax-h3-realistic-quiz-prince/realistic_quiz_prince_scene_01_canvas_grouped.json` | Grouped canvas export for realistic quiz scene 01. |
| MiniMax H3 realistic quiz | `workflows/minimax-h3-realistic-quiz-prince/realistic_quiz_prince_scene_02_canvas_grouped.json` | Grouped canvas export for realistic quiz scene 02. |

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
| Taomate 3-step, anime example | `workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_current_model_vae_current_stack_7caf6811_ce69_468d_a66a_d14dd4ab9acb_a4224d67_47da_450b_98ec_cf50d5723e5c.json`<br>`workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_profile_2_current_stack_384323bb_7ed9_47ec_8c55_8111dd847def_75328298_ad48_4e61_9839_528491e0c5f6.json`<br>`workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_profile_3_current_stack_68018c31_7642_4cd9_be87_9f52de35aff9_2be7a4a3_b4d3_431b_b637_322a20326abf.json`<br>`workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_profile_4_current_stack_5e076a97_a1cc_4e29_ac6f_5345f82c3e8b_d50e612f_eea9_4ac0_852d_379a532062e7.json`<br>`workflows/minimax-h3-taomate_3sstep/anime example/scene_01_3steps_1mp_profile_5_current_stack_e7266f40_a88e_4431_88e3_636c1bb7e0e5_85e89a3b_701b_4e7e_b629_f78e7e7d31b6.json` |
| Taomate 3-step, realism example | `workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_current_model_vae_current_stack_23ae4c2b_556c_40c0_be76_8a402e0a2c83_9520e3be_9bf8_4dcf_930c_b565e17e008e.json`<br>`workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_profile_2_current_stack_09da878c_ab30_4f73_bc3f_688e815b7cca_e7e3e10b_3c6a_4a8f_a777_2d46fa05b98a.json`<br>`workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_profile_3_current_stack_afb8d5c1_1210_4043_ad76_9484b49b6ea5_cc7a3f22_43bf_45f4_a0dd_3a3c6adcd7a8.json`<br>`workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_profile_4_current_stack_353e3cd4_c408_4a4e_9146_aa980348f043_5a2b77dc_0fca_4255_bad9_2a54eaa9cf37.json`<br>`workflows/minimax-h3-taomate_3sstep/realism example/scene_01_3steps_1mp_profile_5_current_stack_37e4640b_d2bd_4374_9dd6_e139e69b24f0_d99767e7_0906_42c0_b90b_d17afffcf0ec.json` |

## How to use

1. Download or clone this repo.
2. Open ComfyUI.
3. Drag a matching workflow JSON onto the ComfyUI canvas, or load it through the
   workflow menu.
4. Install any missing custom nodes reported by ComfyUI.
5. Add the required models/checkpoints to your local ComfyUI model folders.
6. Review the prompts, image inputs, output path, and video settings before
   running.

## Video notes

Each YouTube video should use a matching slug in both places:

- `workflows/<video-slug>/` for workflow JSON files.
- `docs/videos/<video-slug>/` for prompts, notes, model requirements, and
  troubleshooting.

Available notes include:

- [LTX 2.3 start-frame IA2V](videos/ltx-2-3-ia2v-start-frame/notes.md)
- [LTX 2.3 start/middle/last IA2V](videos/ltx-2-3-ia2v-start-middle-last-frame/notes.md)
- [LTX 2.5 IA2V](videos/ltx-2-5-ia2v/notes.md)
- [LTX 2 camera-control LoRAs](videos/ltx-2-camera-control-loras/notes.md)
  and [prompt table](videos/ltx-2-camera-control-loras/prompts.md)
- [MiniMax H3 Turbo](videos/minimax-h3-turbo/notes.md)
- [MiniMax H3 multishot](videos/minimax-h3-multishot/notes.md)
- [MiniMax H3 latent upscaler](videos/minimax-h3-latent-upscaler/notes.md)

## Repo policy exception

This is a public workflow-sharing repo, not a packaged app. It does not use
app-style version bumps or generated changelog files for every workflow update.

## Requirements

This repo does not bundle models, checkpoints, or generated outputs. Common
requirements include:

- [ComfyUI](https://github.com/comfyanonymous/ComfyUI)
- ComfyUI core nodes
- [ComfyUI-VideoHelperSuite](https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite)
- Any model files referenced by the workflow you are running

A workflow may require additional custom nodes and model files. If it fails to
load, ComfyUI will usually identify the missing dependency.

## Repo layout

```text
.
├── docs/
│   ├── README.md
│   ├── workflows.md
│   ├── videos/
│   │   └── <video-slug>/
│   ├── tasks/
│   └── bugs/
└── workflows/
    └── <video-slug>/
        └── *.json
```

## License

No license has been added yet. Until a license is added, please treat this as
shared for viewing and reference only.
