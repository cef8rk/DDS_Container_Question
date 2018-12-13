#!/bin/bash
cd ..
docker exec -it dds_question_web_server_1 ls
docker cp ./admin/ dds_question_web_server_1:/var/www/html/
docker exec -it dds_question_web_server_1 ls

docker exec dds_question_web_server_1 chmod +x ./script_runner.sh
docker exec dds_question_web_server_1 ./script_runner.sh
