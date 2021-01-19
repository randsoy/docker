
docker run --privileged -d --name ct-build -p 2222:22 -p 9600-9700:9600-9700 -v /home/hst:/data go-npm-build:1.15.6-buster