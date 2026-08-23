# LTX 2.3 IA2V - Start, Middle, and Last Frames

- Workflow: `../../../workflows/ltx-2-3-ia2v-start-middle-last-frame/video_ltx2_3_ia2v_start_middle_last_frame.json`
- Inputs: start, middle, and last images plus one audio file.
- The middle-frame index is calculated from the generated sequence length.
- The last-frame guides use frame index `-1`.
- Both middle and last images are applied in the low- and high-resolution passes.

This is a dedicated copy of the existing proven middle-frame graph. The original workflow remains unchanged.
