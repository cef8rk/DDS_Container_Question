# DDS_Container_Question
***WARNING*** I messed up the password for clone.sh. it is theempiredidnothingwrong instead of empiredidnothingwrong

***FILE LIST***
This project includes the following files:
1. Dockerfile: This file configures the docker container. Originally, the container ran only 
2. docker-compose: I do not think this file is actually necessary (I didn't end up using gitea, which I will discuss later) but for some reason it worked when I did it that way and not when I ran it with a run command. Chances are I was just missing an option or two, but it seemed more prudent to worry about other parts of the project before fixing this small inefficiency. Furthermore, docker-compose makes stopping and cleaning associated containers and resources simpler, meaning it saved me work in the end.
3. localhost.conf: This file configures the apache server to display the admin directory files. It is configured to run over ssl. I did not have great success with getting 
4. placeholdder.html: This file is a meaningless html page used to test the server. It is added to the container when the container is instantiated. It also exists to verify that clone works properly. It is placed in the admin repo on the container as "index.html".
5. fdqn.conf: this file declares the server name as localhost. I will not pretend to know why it was suggest that I do this, but it was an attempt to remove the warning message that occurs during the build/run of the container. It never went away, but did not appear to affect the functionality of the container
6. bin/
  a. install.sh: This file builds the docker container. (Note: I think I may have not done enough here. I am not sure 

