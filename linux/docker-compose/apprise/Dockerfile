# This Dockerfile is not meant to be used as is. Modify as needed.

# Example image. Replace hello-world with your source image.
FROM hello-world

# Every RUN execution adds another layer.
# It's better to run them in less RUN statements, possibly even just one.
RUN echo "Run your commands here" \
  && echo "Chain them with &&" \
  && echo "With backslash for readability"

# If any files from the host machine are required, they should be copied here.
COPY host_source_file container_destination

# Assumes /tcp, for udp add 80/udp. Multiple ports can be "exposed" at once.
EXPOSE 80 8080 443 5000/udp

# Command to be executed upon container build
CMD ["echo", "Every element separated in quotes"]
