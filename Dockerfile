# Start from debian linux image (DockerHub)
FROM debian:stable

# Add custom label
LABEL maintainer "Irene Roman <irene.roman@umedicina.cat>" \
      version "0.1" \
      description "https://hub.docker.com/layers/irdeganouvic/docker_handson/graphpres/images/sha256-83041771257be9a03e01e4bb587e701f4eee654aea1d3ad1178d48faf7b45954?context=repo"

# Install R (after apt-get update)
RUN apt-get update && apt-get install -y r-base

# Install R package 'gplots'
RUN R -e 'install.packages("gplots", repos = "http://cloud.r-project.org/")'

# Make the folder '/scripts' in the container
RUN mkdir /scripts

# Copy 'scripts/script.R' to the folder '/scripts' in the container
ADD scripts/script.R /scripts
