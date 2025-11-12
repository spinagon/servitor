FROM alpine:3.21

RUN apk --no-cache --upgrade add \
    git \
    git-lfs \
    curl \ 
    jq \
    bash \ 
    build-base \
    valgrind \
    cppcheck \ 
    alpine-sdk \
    check-dev \
    subunit-dev \
    gtest-dev \
    lcov \
    gzip \
    ncurses-dev \
    clang18-extra-tools && \
    ln -s /usr/lib/llvm18/bin/clang-format /usr/bin/clang-format 

COPY main.sh .

ENTRYPOINT ["/bin/bash","main.sh"]
