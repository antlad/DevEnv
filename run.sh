#!/bin/bash
u_id=`id -u`
g_id=`id -g`
port=5901
docker run -it --rm -p $port:$port --net=bridge -v /home/${USER}:/home/dev varcalc_devenv bash -c "addgroup --gid ${g_id} ${USER} && useradd ${USER} -u ${u_id} -g ${g_id} --home /home/dev && su ${USER} -c \"export USER=${USER} && /opt/TurboVNC/bin/vncserver :2 -xstartup startxfce4 -rfbport $port -geometry 1920x1080 -depth 16 -3dwm && tail -F /home/dev/.vnc/*.log\" "
