
FILE1="/home/${USER}/aws_host.properties"
FILE2="app-config.properties"
MATCH_PATTERN="AWS_HOST"



if grep -Fxq "$MATCH_PATTERN" $FILE2
then
	    echo "code if found"
	    
    else
	    echo "code if not found"
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

