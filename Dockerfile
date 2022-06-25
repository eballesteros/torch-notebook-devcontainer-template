FROM pytorchlightning/pytorch_lightning:base-cuda-py3.9-torch1.11

RUN pip install timm==0.5.4 fastai==2.7.3

# create non-root user
# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
ARG USERNAME=nonroot
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user 
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN pip install kaggle==1.5.12

USER $USERNAME