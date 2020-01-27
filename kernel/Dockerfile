FROM cmcquinn/snickerdoodle-docker
LABEL maintainer="cameron.mcquinn@gmail.com"
COPY init.sh /tmp/init.sh
RUN /tmp/init.sh
ENV PATH "/usr/lib/ccache:$PATH"