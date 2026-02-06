FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    ffmpeg \
    espeak-ng \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install TTS fastapi uvicorn

EXPOSE 8000

CMD ["tts-server", "--model_name", "tts_models/en/ljspeech/tacotron2-DDC", "--port", "8000"]
