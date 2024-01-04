FROM ubuntu:22.04

WORKDIR /climate-trend-scanner

#RUN apt-get update && apt-get install -y \
#    build-essential \
#    ca-certificates \
#    curl \
#    software-properties-common \
#    git \
#    && rm -rf /var/lib/apt/lists/*

RUN apt update
RUN apt install -y
#RUN apt -y upgrade
RUN apt install -y  python3-pip

#RUN pip install --upgrade pip

COPY ./ /climate-trend-scanner

RUN pip install -r /climate-trend-scanner/requirements.txt 

#RUN pip3 install spacy

EXPOSE 8501

WORKDIR /climate-trend-scanner/app

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health



ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
# CMD ["streamlit", "run", "app\app.py", "--server.port=8501", "--server.address=0.0.0.0"]
