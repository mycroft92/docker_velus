docker build  --platform linux/amd64 --tag=broseph0 -f $PWD/Dockerfile .
docker run --name broseph --platform linux/amd64 -v /home/mycroft/work/docker_setup:/home/shared -it
