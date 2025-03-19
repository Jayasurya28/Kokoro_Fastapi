$env:PHONEMIZER_ESPEAK_LIBRARY="C:\Program Files\eSpeak NG\libespeak-ng.dll"
$env:PYTHONUTF8=1
$Env:PROJECT_ROOT="$pwd"
$Env:USE_GPU="false"
$Env:USE_ONNX="false"
$Env:PYTHONPATH="$Env:PROJECT_ROOT;$Env:PROJECT_ROOT/api"
$Env:MODEL_DIR="src/models"
$Env:VOICES_DIR="src/voices/v1_0"
$Env:WEB_PLAYER_PATH="$Env:PROJECT_ROOT/web"

uvicorn pip install -e ".[cpu]"
uvicorn run --no-sync python docker/scripts/download_model.py --output api/src/models/v1_0
uvicorn run --no-sync uvicorn api.src.main:app --host 0.0.0.0 --port 8880