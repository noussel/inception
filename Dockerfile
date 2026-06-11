FROM debian:bullseye
COPY script.sh /
ENTRYPOINT ["/script.sh"]
EXPOSE 80

