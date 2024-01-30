echo Builds and pushes docker image to AWS ECR
set REPOSITORY="my-repository"
set VERSION="latest"
set AWSID="436198186067"
set REGION="us-west-2"

aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin %AWSID%.dkr.ecr.%REGION%.amazonaws.com/%REPOSITORY%

docker build --tag %REPOSITORY% .

docker tag %REPOSITORY%:%VERSION% %AWSID%.dkr.ecr.%REGION%.amazonaws.com/%REPOSITORY%:%VERSION%

docker push %AWSID%.dkr.ecr.%REGION%.amazonaws.com/%REPOSITORY%:%VERSION%