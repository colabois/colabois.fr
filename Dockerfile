FROM jekyll/jekyll
RUN apk add sudo
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN gpasswd -a jekyll wheel
RUN apk add openssh
RUN apk add rsync
CMD ["/bin/bash"]
