#!/bin/bash
u_id=`id -u`
g_id=`id -g`
docker run -it --rm -p 5901:5901 -v /home/${USER}/boom:/home/dev vladtroinich/devenv bash -c "addgroup --gid ${g_id} ${USER} && useradd ${USER} -u ${u_id} -g ${g_id} --home /home/dev && su ${USER} -c \"export USER=${USER} && vncserver :1 -rfbport 5901 -geometry 1920x1080 -depth 24 && tail -F /home/dev/.vnc/*.log\" "