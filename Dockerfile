FROM rocker/verse
ARG linux_user_pwd
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
FROM rocker/verse
ARG linux_user_pwd
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:kelleyk/emacs \
    && DEBIAN_FRONTEND=noninteractive apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y emacs28 python3-pip sqlite3 lighttpd x11-apps \
    && echo "rstudio:$linux_user_pwd" | chpasswd


RUN R -e "install.packages('tidyverse', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages(c('ggplot2','readr','rmarkdown','dplyr','tidyr','knitr','data.table','devtools'), repos='https://cloud.r-project.org/')"
RUN R -e "library(devtools); install_github('lbenz730/ncaahoopR')"







