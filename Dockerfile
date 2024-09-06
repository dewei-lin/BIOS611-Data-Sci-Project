FROM rocker/rstudio
RUN apt update && yes | unminimize && apt install -y man-db && rm -rf /var/lib/apt/lists/*
EXPOSE 8787
USER rstudio
ENV PASSWORD=yourpassword
CMD ["/init"]
