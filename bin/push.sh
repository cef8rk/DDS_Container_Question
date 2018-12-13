#!/bin/bash

cd ..
cd admin
docker exec -it dds_question_web_server_1 ls
docker cp $1 dds_question_web_server_1:/var/www/html/admin/
docker exec -it dds_question_web_server_1 ls

docker exec dds_question_web_server_1 chmod +x ./script_runner.sh
docker exec dds_question_web_server_1 ./script_runner.sh
