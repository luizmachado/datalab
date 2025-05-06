FROM tensorflow/tensorflow:2.18.1-gpu

# Evita prompts interativos durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instala utilitários e JupyterLab
RUN apt-get update && \
    apt-get install -y python3-pip python3-dev build-essential curl git && \
    pip install --upgrade pip && \
    pip install jupyterlab

# Instala bibliotecas populares de Data Science e Machine Learning
RUN pip install \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn \
    xgboost \
    lightgbm \
    keras \
    notebook \
    ipywidgets \
    plotly \
    statsmodels \
    tqdm \
    openpyxl \
    xlrd \
    optuna \
    jupyterlab_widgets \
    jupyterlab_vim \
    pyarrow \
    fastparquet \
    protobuf==3.20.*  # Corrige problemas com certas libs em algumas distros

# Define diretório de trabalho
WORKDIR /workspace

# Expõe porta do JupyterLab
EXPOSE 8888

# Comando para iniciar o JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

