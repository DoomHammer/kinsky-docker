FROM debian
RUN apt-get update
RUN apt-get install -qqy sudo libmono-winforms2.0-cil mono-gmcs
ADD http://oss.linn.co.uk/Releases/Kinsky/Davaar/kinsky_4.3.13-1_all.deb /
RUN dpkg -i /kinsky_4.3.13-1_all.deb

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
CMD /usr/bin/Kinsky
