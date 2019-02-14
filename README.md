# Docker-P2PaLA

 Docker image that isolates and automates the use of the P2PaLA framework for text line detection. 

## Requirements

- This software requires the installation of docker in the machine where it will be executed. 

	curl -fsSL https://get.docker.com -o get-docker.sh && chmod +x get-docker.sh && sudo sh get-docker.sh

- Optinally add your user to the docker group:

sudo usermod -aG docker $your_user

(this requires you to log out and log in to take effect)


## Use of the Docker Image

2. Build the p2pala-docker image (sudo only required if user not in docker group)
sudo docker build --rm  . -t p2pala-docker

3. Select a $workdir with an input and output subfolders inside. Copy the page the images of
wich you would like to detect the textlines inside $workdir/input. Execute the following command: 
(sudo only required if user not in docker group)

sudo docker run --rm -it --name pala --mount 'type=bind,src=$workdir,dst=/work-dir' --shm-size="1g" p2pala-docker:latest

4. Results can be found in $workdir/output/results/prod/page
