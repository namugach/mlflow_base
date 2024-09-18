FROM namugach/ubuntu-basic:24.04-kor

RUN sudo apt-get update && sudo apt-get -y install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev 

RUN apt-get install -y netcat-openbsd

RUN curl https://pyenv.run | bash

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"\n \
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"\n \
eval "$(pyenv init --path)"\n \
eval "$(pyenv init -)"\n \
eval "$(pyenv virtualenv-init -)"' >> /etc/profile


# pyenv 환경 설정을 /root/.bashrc 에 추가하고, 바로 pyenv를 사용할 수 있도록 설정을 로드한다.
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"\n \
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"\n \
eval "$(pyenv init --path)"\n \
eval "$(pyenv init -)"\n \
eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc


RUN export PYENV_ROOT="$HOME/.pyenv"  \
&& export PATH="$PYENV_ROOT/bin:$PATH"  \
&& eval "$(pyenv init --path)"  \
&& eval "$(pyenv init -)"  \
&& pyenv install 3.12.3

# 설치한 파이썬 버전을 기본 버전으로 설정
RUN export PYENV_ROOT="$HOME/.pyenv" \
&& export PATH="$PYENV_ROOT/bin:$PATH" \
&& eval "$(pyenv init --path)" \
&& eval "$(pyenv init -)" \
&& pyenv global 3.12.3 \
&& pip install --upgrade pip \
&& pip install mlflow \
&& pip install virtualenv \
&& pip install xgboost