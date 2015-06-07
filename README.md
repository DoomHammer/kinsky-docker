# Preparing
In order for this to work you should first issue `xhost local:root`. For Mac OS X see: https://github.com/docker/docker/issues/8710

# Building
Build with `docker build -t kinsky .`

# Running
Run with `docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --net=host kinsky`
