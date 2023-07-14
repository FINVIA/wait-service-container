ARG BUILDER_IMAGE

FROM ${BUILDER_IMAGE} AS builder

RUN git clone https://github.com/magiclen/wait-service

WORKDIR /root/src/wait-service

RUN cargo build --release -q

FROM scratch

COPY --from=builder \
    /root/src/wait-service/target/x86_64-unknown-linux-musl/release/wait-service \
    /bin/
