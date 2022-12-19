FROM debian:bullseye-20211201
RUN apt update
RUN apt -y install build-essential

# RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

COPY . /workdir
WORKDIR /workdir

RUN ./install.sh docker
RUN g++ ./OpenPLC_Simulink/simlink.cpp -o simlink -pthread
ENTRYPOINT ["./entrypoint.sh"]
