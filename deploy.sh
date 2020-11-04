#### #!/usr/bin/sh
FILE1="/home/${USER}/aws_host.properties"
FILE2="./app-config.properties"
STRING="AWS_HOST"

echo "Update the app-config properties with ELB hostname"

if [ -z $(grep "$STRING" "$FILE1") ]; then

        echo 'the ELB host exist' >&2
else

        echo 'the ELB host doesnt exist' >&2
        cat $FILE1 >> $FILE2
fi

echo "Build the docker image"

docker build --tag shortenurl:1.0 .

echo "Verify the docker image"

docker images

echo "Run docker container"

docker run -d -p 80:5000 shortenurl:1.0

echo "docker ps"

docker ps