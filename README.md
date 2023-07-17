# `wait-service-container`: wait for things, containerized

Wraps <https://github.com/magiclen/wait-service/> in a Docker container.

The output container contains only the release binary, `wait-service`, located at `/bin/wait-service`.

The intended usage pattern goes something like this:

```docker
FROM ghcr.io/finvia/wait-service-container:main AS wait-service

FROM alpine AS build

# do your build stuff here
RUN cp "$(which true)" /bin/your-service

FROM scratch

COPY --from=wait-service \
    /bin/wait-service \
    /usr/local/bin/

COPY --from=wait-service \
    /bin/entrypoint.sh \
    /usr/local/bin/

COPY --from=build /bin/your-service /bin

ENTRYPOINT ["entrypoint.sh"]
CMD ["your-service"]
```
