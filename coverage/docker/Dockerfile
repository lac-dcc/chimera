################################################# Image #################################################
FROM ubuntu:22.04

############################################# Date and Time #############################################
ENV TZ="America/Sao_Paulo"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && apt-get install -y locales curl wget tar sudo git apt-utils \
  lsb-release software-properties-common gnupg && \
  localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

############################################# Dependencies ##############################################
RUN apt-get update -y && apt-get install -y gcc g++ vim nano python3 python3-pip \
  python3-dev automake make build-essential
RUN pip3 install matplotlib pandas pyyaml

############################################### LLVM ####################################################
RUN wget -qO- https://apt.llvm.org/llvm.sh | bash -s -- 16
RUN ln -s /bin/clang-16 /bin/clang && ln -s /bin/clang++-16 /bin/clang++ && \
  ln -s /bin/llvm-cov-16 /bin/llvm-cov && ln -s /bin/llvm-profdata-16 /bin/llvm-profdata

########################################## Clone Chimera ################################################
RUN cd $HOME && git clone https://github.com/lac-dcc/chimera

############################################## Bazel ####################################################
RUN apt-get update -y && apt-get install -y apt-transport-https
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
RUN mv bazel-archive-keyring.gpg /usr/share/keyrings
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | \
  tee /etc/apt/sources.list.d/bazel.list
RUN apt-get update -y && apt-get install -y bazel

############################################## Verible ###################################################
RUN cd $HOME && git clone https://github.com/joaovam/verible.git && cd verible && \
  bash $HOME/chimera/coverage/scripts/verible_coverage_build.sh

########################################## Icarus Verilog ################################################
RUN apt-get install -y autoconf gperf bison flex
RUN cd $HOME && git clone https://github.com/steveicarus/iverilog.git && \
  cd iverilog && bash $HOME/chimera/coverage/scripts/iverilog_coverage_build.sh

############################################# Verilator ##################################################
RUN apt-get install -y help2man perl libfl2 libfl-dev zlib1g zlib1g-dev ccache mold
RUN cd $HOME && git clone https://github.com/verilator/verilator.git && \
  cd verilator && bash $HOME/chimera/coverage/scripts/verilator_coverage_build.sh

############################################ Workdir #####################################################
WORKDIR /root/chimera
ENTRYPOINT ["/bin/bash"]
