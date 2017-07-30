#####################
#  CLIENT COMMANDS  #
#####################

AWS_CLI_IMAGE_NAME=aws-cli
AWS_CLI_CONTAINER_IMAGE_NAME=aws-cli

# Run these on the machine you will be running the AWS CLI container from.

aws-cli-build:
	docker build -t $(AWS_CLI_IMAGE_NAME) .

aws-cli-run: aws-cli-build
	docker run --rm -it --name $(AWS_CLI_CONTAINER_IMAGE_NAME) $(AWS_CLI_IMAGE_NAME)


########################
#  LIGHTSAIL COMMANDS  #
########################

INSTANCE_NAME=lightsail-ubuntu

# Once you've run `aws configure` or configured your AWS environment, here are 
# some basic commands to get you going.

# Copy and adapt for your own usage.

create-instance:
	aws lightsail create-instances \
        --instance-names '$(INSTANCE_NAME)' \
        --availability-zone 'us-west-2a' \
        --blueprint-id 'ubuntu_16_04_1' \
        --bundle-id 'micro_1_0' \
        --user-data file://'configure.sh'

get-instances:
	aws lightsail get-instances

get-active-names:
	aws lightsail get-active-names

delete-instance:
	aws lightsail delete-instance --instance-name $(INSTANCE_NAME)
