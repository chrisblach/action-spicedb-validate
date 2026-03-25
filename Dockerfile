ARG ZED_VERSION=latest
FROM quay.io/authzed/zed:v0.35.0 AS zed

FROM ubuntu:22.04
COPY --from=zed /usr/local/bin/zed /zed
RUN chmod +x /zed
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["bash", "/entrypoint.sh"]
