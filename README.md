# Docker-P2PaLA

 Docker image that isolates and automates the use of the P2PaLA framework for text line detection. 

## Requirements

- This software requires the installation of docker in the machine where it will be executed. Execute
the following comand in order to download and install the bleeding edge version of docker: 
	```
	curl -fsSL https://get.docker.com -o get-docker.sh && chmod +x get-docker.sh && sudo sh get-docker.sh
	```
	You can also install Docker following the specific instructions for your OS - [Docker CE](https://docs.docker.com/install/overview/)
- Optionally add your user to the docker group:
	```
	sudo usermod -aG docker $your_user
	```
	(adding a user to a group requires you to log out and log in order for the change to take effect)

--- 

## Use of the Docker Image

> Note that the use of sudo in the following commands is only required if the user has not been added to the docker group. 

1. In order to use the image (and launch a container)  you will need to first build the container. Go inside
the downloaded repository and execute the following command: 
	```
	sudo docker build --rm  . -t p2pala-docker
	```
> Although building the docker image takes time it only needs to be performed once. If any changes are performed
in any of the files a recompilation of the image will be required. Before building the image a config.txt and model.pth
are required to be present in their respective folders if automatic region detection is to be performed. Alternatively
the run.sh can be modified (before image compilation) to look for the models in the binded folder. 

2. Once the docker image is compiled their exists two ways of using it: 

* Using the image to login and perform complex experimentation (train, decode) 
	```
	sudo docker run --rm -it --name pala --mount 'type=bind,src=$workdir,dst=/work-dir' --shm-size="1g" p2pala-docker:latest bash
	```
* Using the image to automatically perform the region detection as per a trained model and config provided at image build time
	```
	sudo docker run --rm -it --name pala --mount 'type=bind,src=$workdir,dst=/work-dir' --shm-size="1g" p2pala-docker:latest
	```
> To use the automatic run.sh script you must substitute a $workdir with a local folder that contains input and
output subfolders. The input folder must contain the images of which P2PaLA must detect the regions as per the 
the provided model. The output folder will contain the results provided by P2PaLA (Specifically the page
results will be in $workdir/output/results/prod/page) 

---

## Authors
* **Vicente Bosch ** - *Docker Image setup and testing*
* **Lorenzo Quiros ** - *Creator of P2PaLA* - [P2PaLA](https://github.com/lquirosd/P2PaLA)
