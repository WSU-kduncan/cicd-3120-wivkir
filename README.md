# Project Overview
  1. How you installed docker + dependencies (WSL2, for example)
```		
sudo apt-get remove docker docker-engine docker.io containerd runc
		
sudo apt-get update
			
sudo apt-get install \ 		
	ca-certificates \
	curl \
	gnupg \
	lsb-release
		
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu 
  				
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```	
* Install Docker
	
    `sudo apt-get install docker-ce docker-ce-cli containerd.io`

2. How to build the container

    `sudo docker build -t apache .`

3. How to run the container

    `sudo docker run -d apache`

4. How to view the project (open a browser...go to ip and port...)

    Open your browser of choice

    In the address bar, type 18.210.53.146/index.html, and press enter

Resources used
  * https://docs.docker.com/engine/install/ubuntu/
  * https://dzone.com/articles/how-to-install-and-configure-apache2 
  * https://www.linux.com/training-tutorials/how-create-docker-image/
  * https://techoverflow.net/2019/05/18/how-to-fix-configuring-tzdata-interactive-input-when-building-docker-images/

Create DockerHub public repo

  1. Create a docker hub account here: https://hub.docker.com/

  2. On the homepage, click the Repositories link at the top of the page

  3. Click the blue `Create Repository` button

  4. Add a name and description then click `Create`

How to authenticate with DockerHub via CLI using Dockhub credentials
  * Use github secrets, and their variable names in the code
    `${{ secrets.DOCKER_USERNAME }}`
    `${{ secrets.DOCKER_PASSWORD }}`	

What credentials would you recommend providing?
  * Username and Password

What credentials are needed
  * Username and Password
    
Set secrets and secret names
	
  1. Go to the repository that the secrets are for

  2. Click `Settings` for the repository

  3. Click `Secrets`, then Actions on the sidebar	

  4. Click `New repository secret`

  5. Enter a name for the secret and it's contents
	
  6. Repeat until all needed secrets are entered

Behavior of GitHub workflow

What does it do and when
  * Whenever the release event is triggered on github, a new build of the image is uploaded to docker hub.

Variables to change (repository, etc.)
  * Change images to `docker-hub-namespace/my-docker-hub-repository`, ie `jacobapone/project5`

***********
Not done yet

* Container restart script

    what it does

* Webhook task definition file

    what it does

* Setting up a webhook on the server

    How you created you own listener
    How you installed and are running the webhook on GitHub

* Setting up a notifier in GitHub or DockerHub
