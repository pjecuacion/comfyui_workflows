"""ComfyUI audio guard for model-generated non-finite waveform samples."""

import torch


class MiniMaxH3AudioFiniteGuard:
    @classmethod
    def INPUT_TYPES(cls):
        return {"required": {"audio": ("AUDIO",)}}

    RETURN_TYPES = ("AUDIO",)
    RETURN_NAMES = ("audio",)
    FUNCTION = "sanitize"
    CATEGORY = "audio/safety"

    def sanitize(self, audio):
        waveform = audio["waveform"]
        safe = torch.nan_to_num(waveform, nan=0.0, posinf=1.0, neginf=-1.0)
        safe = safe.clamp(-1.0, 1.0)
        return ({**audio, "waveform": safe},)


NODE_CLASS_MAPPINGS = {
    "MiniMaxH3AudioFiniteGuard": MiniMaxH3AudioFiniteGuard,
}

NODE_DISPLAY_NAME_MAPPINGS = {
    "MiniMaxH3AudioFiniteGuard": "MiniMax H3 Audio Finite Guard",
}

__all__ = ["NODE_CLASS_MAPPINGS", "NODE_DISPLAY_NAME_MAPPINGS"]
