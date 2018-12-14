# DDS_Container_Question
***WARNING*** I messed up the password for clone.sh. it is theempiredidnothingwrong instead of empiredidnothingwrong

***INSTALL LIST***
python
openssl
docker/docker-compose
lynx

***FILE LIST***
This project includes the following files:
1. Dockerfile: This file configures the docker container. Originally, the container ran only 
2. docker-compose: I do not think this file is actually necessary (I didn't end up using gitea, which I will discuss later) but for some reason it worked when I did it that way and not when I ran it with a run command. Chances are I was just missing an option or two, but it seemed more prudent to worry about other parts of the project before fixing this small inefficiency. Furthermore, docker-compose makes stopping and cleaning associated containers and resources simpler, meaning it saved me work in the end.
3. localhost.conf: This file configures the apache server to display the admin directory files. It is configured to run over ssl. I did not have great success with getting 
4. placeholdder.html: This file is a meaningless html page used to test the server. It is added to the container when the container is instantiated. It also exists to verify that clone works properly. It is placed in the admin repo on the container as "index.html".
5. fdqn.conf: this file declares the server name as localhost. I will not pretend to know why it was suggest that I do this, but it was an attempt to remove the warning message that occurs during the build/run of the container. It never went away, but did not appear to affect the functionality of the container
6. bin
  a. install.sh: This file builds the docker container. (Note: I think I may have not done enough here. I am not sure what installs needed to be performed on each run (i.e. do all necessary resources need to be installed or is configuring the container sufficient?)
  b. start.sh: This file starts the docker container with docker compose up
c. clone.sh: This file clones the repository currently in the admin repo on the container into the admin folder on the local machine
d. push.sh: Takes a file name and pushes the file to the admin respository. Runs all .sh files in the repository and stores the results in index.html which is displayed by the webserver

7. gitea: This folder ended up being mostly unused (I still serve it on port 4443 to demonstrate what the UI would look like for a more complete and realistic solution to the problem of creating a locally hosted git server. Gitea isn't perfect but it is a relatively effective tool for developing a local git server. I did not employ it because it felt canned and because I wasn't sure what the parameters of the project were.

***PROBLEMS ENCOUNTERED***
1. There was some issue with the ssh configuration which caused the machine to instantly close the connection. I do not know what exactly brought about this error.


