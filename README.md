# docker-netdata-cuda
netdata/netdata modified to add support for NVidia GPU Data Collector

## Usage
```
docker run \
-d \
--name=netdata \
-p 19999:19999 \
-v /etc/passwd:/host/etc/passwd:ro \
-v /etc/group:/host/etc/group:ro \
-v /proc:/host/proc:ro \
-v /sys:/host/sys:ro \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
-v /opt/nvidia:/usr/local/nvidia:ro \
--cap-add SYS_PTRACE \
--security-opt apparmor=unconfined \
--security-opt seccomp:unconfined \
--device /dev/nvidiactl \
--device /dev/nvidia-uvm \
--device /dev/nvidia0 \
mediadepot/netdata-cuda
```
