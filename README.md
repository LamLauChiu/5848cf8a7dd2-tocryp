# 5848cf8a7dd2-tocryp

#Question-1: Access Log analytics
Please prepare 3 shell script(s) (any shell script executable on Linux in AWS
environment) to:
1. Count the total number of HTTP requests recorded by this access logfile
2. Find the top-10 (host) hosts makes most requests from 2019-06-10 00:00:00 to
2019-06-19 23:59:59, inclusively
3. Find out the country with most requests originating from (according to the sourceIP)
----

Answer:

Requirements:

Linux server:

If launching the Amazon EC2 instance please consider below as user data, otherwise please run with sudo

* yum install python3 -y
* yum install geoip
* curl -O https://bootstrap.pypa.io/get-pip.py
* python3 get-pip.py --user
* yum install git -y

a) Run following command to cound the HTTP request

download the code :
git clone https://github.com/chaudharysud/5848cf8a7dd2-tocryp.git

output: gitdownload

![Screenshot](gitdownload.PNG)


```console
git clone https://github.com/chaudharysud/5848cf8a7dd2-tocryp.git

cd Quesion1

#change the permission of file

chmod u+x *.sh

./counthttp.sh HTTP ./access.log

```
Output:

![Screenshot](./Question1/Output1a.PNG)


b) 
#Find the top-10 (host) hosts makes most requests from 2019-06-10 00:00:00 to 2019-06-19 23:59:59, inclusively

This script will create the host.txt which will conatin top 10 host, please refer the output

```console
cd Question1

./toptenhost.sh
```
Output:

![Screenshot](./Question1/output2a.PNG)

c) Get host by country


```console
cd Question1

./toptenhost.sh
```
Output:

![Screenshot](./Question1/Output3a.PNG)

 ```console
cd Question1

 ./getcountrybyhost.sh
```
 

#Question-2:AWS API programming 
Please help to prepare a script to query AWS API and look up the public IP of the instance with the specific EC2 Name tag. Then the script should execute the ssh command 
ssh ec2-user@EC2_PUBLIC_IP .
----


Requirements:
* Please install boto3 API of python3
* Please make sure pem key is at the same level as script
* Associate the Tag : api-server-002 in EC2 instance


 ```console
cd Question1

# run following command

cd Question2

python ./discoverec2bytag.py us-east-2 my_aws_key.pem ec2-user api-server-002

```







#Question-3:System design and Implementation 
Please implement a URL shortener service (e.g. https://bitly.com/) 
Implement a simple bit.ly like service
----








Requirements

* Login to EC2 instance
* RUN CMD 'sudo yum update'
* Install Python3 RUN CMD 'sudo yum install python3'
* Install pip : 
    *   curl -O https://bootstrap.pypa.io/get-pip.py
    *   python3 get-pip.py --user
* Install shorturl app related packages
    * pip install -r requirements.txt
* Run ShortUrl App : python3 app.py
* Install docker
    * sudo amazon-linux-extras install docker   
    * sudo yum install docker 
    * sudo service docker start
    * Add user in docker deamon
        * sudo groupadd docker
        * sudo usermod -aG docker ${USER}
        * logout and log in again to reflect the changes.
 * Download code from github
   * git clone https://github.com/chaudharysud/5848cf8a7dd2-tocryp.git
* Buid docker image
   *  docker build --tag shortenurl:1.0 .
* Run docker container from snapshot
   *  docker run -d -p 80:5000 shortenurl:1.0

System Design 

* To improve the performance MEMCache can be introduced between EC2 instance and database.
* With Cloudformation implemenation currently the solution of database is based on single instance but the code is configurable to run with postgres if the database insatnce created manually.




![Screenshot](Systemdesign.PNG)
 
