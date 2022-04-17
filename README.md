# Project Overview
* Run Project Locally
  1. how you installed docker + dependencies (WSL2, for example)
    * Create repository

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

  2. how to build the container

    `sudo docker build -t apache .`

  3. how to run the container

    `sudo docker run -d apache`

  4. how to view the project (open a browser...go to ip and port...)

    Open your browser of choice

    In the address bar, type 18.210.53.146/index.html, and press enter

* Resources used
  * https://docs.docker.com/engine/install/ubuntu/
  * https://dzone.com/articles/how-to-install-and-configure-apache2 
  * https://www.linux.com/training-tutorials/how-create-docker-image/
  * https://techoverflow.net/2019/05/18/how-to-fix-configuring-tzdata-interactive-input-when-building-docker-images/

* Create DockerHub public repo

  Create a docker hub account here: https://hub.docker.com/

  On the homepage, click the Repositories link at the top of the page

  Click the blue `Create Repository` button

  Add a name and description then click `Create`

* How to authenticate with DockerHub via CLI using Dockhub credentials

    what credentials would you recommend providing?

* Configuring GitHub Secrets

    what credentials are needed
		
	Username and Password
    
    set secrets and secret names
	
	Go to the repository that the secrets are for

	Click `Settings` for the repository

	Click `Secrets`, then Actions on the sidebar	

	Click `New repository secret`

	Enter a name for the secret and it's contents

* Behavior of GitHub workflow

    what does it do and when
    variables to change (repository, etc



* Container restart script

    what it does

* Webhook task definition file

    what it does

* Setting up a webhook on the server

    How you created you own listener
    How you installed and are running the webhook on GitHub

* Setting up a notifier in GitHub or DockerHub
