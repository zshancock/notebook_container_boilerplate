FROM tensorflow/tensorflow:2.3.0-jupyter

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

# Set working directory.
WORKDIR /app

# Copy directory and install requirements.
COPY . .
RUN pip install -r requirements.txt

ENTRYPOINT ["jupyter", "notebook", "--port=8888", "--ip=0.0.0.0", "--allow-root"]
