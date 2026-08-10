# Purpose: Prevent MiniMax Turbo audio NaN/Inf samples from crashing AAC encoding.
# Expected behavior: Invalid samples become finite and normal in-range samples remain unchanged.
# Related bug: BUG-002.
# Preconditions: Portable ComfyUI Python includes PyTorch.

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$node = Join-Path $repo 'custom_nodes\minimax-h3-audio-guard\__init__.py'
$python = 'C:\ComfyUI_windows_portable\python_embeded\python.exe'

$script = @"
import importlib.util
import math
import sys
import torch

spec = importlib.util.spec_from_file_location('minimax_audio_guard', r'$node')
module = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = module
spec.loader.exec_module(module)
guard = module.MiniMaxH3AudioFiniteGuard()
source = torch.tensor([[[0.25, float('nan'), float('inf'), -float('inf'), 2.0, -2.0]]])
result = guard.sanitize({'waveform': source, 'sample_rate': 44100})[0]
wave = result['waveform']
assert torch.isfinite(wave).all()
assert wave.abs().max().item() <= 1.0
assert math.isclose(wave[0, 0, 0].item(), 0.25)
assert wave[0, 0, 1].item() == 0.0
assert result['sample_rate'] == 44100
print('BUG-002 audio finite-guard regression validation passed.')
"@

$script | & $python -
if ($LASTEXITCODE -ne 0) { throw 'BUG-002 regression test failed.' }
