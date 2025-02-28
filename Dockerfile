FROM alpine:3.20

RUN apk --no-cache --upgrade add \
    git \
    git-lfs \
    curl \ 
    jq \
    bash \ 
    build-base \
    python3 \
    valgrind \
    cppcheck \ 
    alpine-sdk \
    pcre-dev \ 
    pcre2 \
    check-dev \
    subunit-dev \
    lcov \
    gzip \
    clang18-extra-tools && \
    ln -s /usr/lib/llvm18/bin/clang-format /usr/bin/clang-format 

COPY main.sh .

ENTRYPOINT ["/bin/bash","main.sh"]
