FROM klakegg/hugo:debian

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y git
