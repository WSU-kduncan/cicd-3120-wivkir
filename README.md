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

    `sudo docker build -t my-apache2 .`

3. How to run the container

    `sudo docker run -dit --name my-running-app -p 80:80 my-apache2`

4. How to view the project (open a browser...go to ip and port...)

    Open your browser of choice

    In the address bar, type 18.210.53.146, and press enter

Resources used
  * https://docs.docker.com/engine/install/ubuntu/

***************

Create DockerHub public repo

  1. Create a docker hub account here: https://hub.docker.com/

  2. On the homepage, click the Repositories link at the top of the page

  3. Click the blue `Create Repository` button

  4. Add a name and description then click `Create`

How to authenticate with DockerHub via CLI using Dockhub credentials
  * Use github secrets, and their variable names in the code
    * `${{ secrets.DOCKER_USERNAME }}`
    * `${{ secrets.DOCKER_PASSWORD }}`	

What credentials would you recommend providing?
  * Username and Password/Token

What credentials are needed
  * Username and Password/Token
    
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
  * Change DOCKER_REPO to the repository being uploaded to

************

Container restart script

* The restart bash:
  1. Stops the current container.
  2. Deletes all containers
  3. Pulls the latest container from dockerhub
  4. Runs the new container

Webhook task definition file

  * Redeploy.json runs restart.sh from var/webhook

How you created you own listener

Turn webhook into a service

1. Create webhook.service in /etc/systemd/system
2. Fill webhook.service with the contents listed below
3. run `sudo systemctl enable webhook.service && sudo systemctl start webhook.service`
* webhooks.service contents
```
[Unit]
Description=Webhooks

[Service]
ExecStart=/home/ubuntu/go/bin/webhook -hooks /home/ubuntu/redeploy.json -hotreload

[Install]
WantedBy=multi-user.target
```
How you installed and are running the webhook on GitHub
  *  

Setting up a notifier in GitHub or DockerHub
DockerHub
1. Go to the project page in DockerHub
2. Click `Webhooks` at the top middle of the page
3. Input a descriptive name and the URL to be notified 
    * http://18.210.53.146:9000/hooks/redeploy in my case
4. Click `Create`

Github
1. Go to the repository on Github
2. Click `Settings`, then `Webhooks`, then `Add webhook`
3. Put the URL to be notified into the Payload URL
    * http://18.210.53.146:9000/hooks/redeploy in my case
4. Change Content Type to application/json
5. Input a secret that you will not forget or have stored in a safe location
6. Select `Let me select individual events.`
7. Select `Workflow runs`
8. Click `Add webhook`

* Open port 9000 for inbound traffic on the remote server
