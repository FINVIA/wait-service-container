FROM rust:1.71.0 AS build

RUN cargo install --root / wait-service

FROM scratch

COPY --from=build /bin/wait-service /bin
