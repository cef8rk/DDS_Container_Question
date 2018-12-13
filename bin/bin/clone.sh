#!/bin/bash
result=0
while [ $result -eq 0 ]
do
	
	echo "Enter the Password"
	read password
	result=$(python pass_check.py "$password")
	if [ $result -eq 1 ] 
	then
		echo "Password Correct"
	else
		echo "Password Incorrect, Try Again"
	fi
done
cd ..

docker cp dds_question_web_server_1:/var/www/html/admin/. ./admin/