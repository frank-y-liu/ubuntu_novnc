
docker container rm -f ubuntu-novnc

docker run -d \
  --name ubuntu-novnc \
  --memory=768m \
  --shm-size=128m \
  -p 127.0.0.1:6901:6901 \
  -e PASSWORD=developer \
  -e RESOLUTION=1600x900 \
  -v "$(pwd)":/source \
  frankliu1/ubuntu:novnc_lxqt.arm64

echo "Use URL: http://localhost:6901/vnc.html?password=developer"
echo "To delete the container, use command: docker container rm -f ubuntu-novnc"
