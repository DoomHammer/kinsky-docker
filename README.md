# Preparing
In case your UID/GID is not 1000:1000 you should first run `sed -i -e "s/export uid=.* gid=.* &&/export uid=$UID gid=$GID \&\&/" Dockerfile`

# Building
Build with `docker build -t kinsky .`

# Running
Run with `docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --net=host kinsky`
