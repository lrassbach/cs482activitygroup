In Class Activity – Group 1
I am not responsible for any charges you may incur with AWS. Make sure to do tear down at end of activity.
Clone git repo: 

1.	Authenticate CLI
    a.	Access IAM Dashboard within AWS
    b.	Create an access key for your user. NOTE: root user is not best practice but we will be using that.
    c.	Open up a command prompt:
        i.	Type “aws –version” to insure you have AWS CLI installed.
        ii.	Enter “aws configure”. Enter the access key information that is given to you in previous step.
2.	Create ECR
    a.	Sign into AWS Console.
    b.	Select Elastic Container Registry.
    c.	Create new registry.
3.	Update script variables with information from your registry.
4.	Run script.
5.	In AWS Console, launch ECS.
    a.	Create a cluster:
        i.	Name cluster and select Fargate.
    b.	Create a new task definition:
        i.	Set OS to –
        ii.	CPU 1
        iii.	Memory 3GB
        iv.	Task role –
        v.	Task execution role ecsTaskExecutionRole
        vi.	Name your container
        vii.	Give image URI from container registry
        viii.	Container port 80
        ix.	Protocol TCP
        x.	Port name blank
        xi.	App protocol HTTP
        xii.	Resource allocation:
            1.	CPU 1
            2.	Memory hard limit 3 
            3.	Memory soft limit 1
        xiii.	Turn off all logging
        xiv.	Create!
    c.	Create a service
        i.	Select service
        ii.	Select the family that you just created
        iii.	Select revision 1
        iv.	Name your service
    d.	Navigate to your service
        i.	Select Tasks
        ii.	Select the currently running task
        iii.	Select networking
        iv.	Copy the public IP
    e.	Enter the IP in your web browser with :5000/ added at the end (the port our container exposed)
    i.	You should see hello world
Done!
6.	Bonus: Postman
    a.	Sign into postman and navigate to your workspace 
        i.	Enter your ip as a get request with :5000/math
        ii.	Params should be key:integer and value:x where x is an integer that you would like to square.
        iii.	Hit send! You should receive a response with your integer squared.

7.	Bonus Bonus: Updating the Container
    a.	Access your service
        i.	Stop the currently running task.
    b.	Open app.py.
        i.	Edit the math function to do some math that you would like.
            1.	Interesting thought: what would happen if the function divides by zero (or encounters some other error)?
    c.	Run the batch script.
    d.	Access your service
        i.	Update service 
        ii.	Select your task
        iii.	select networking
        iv.	copy public IP
    e.	Paste your copied IP into your postman
        i.	Enter your ip as a get request with :5000/math
        ii.	Params should be key:integer and value:x where x is an integer that you want to pass to your function.
        iii.	Hit send! You should receive a response with your math problem answered.

8.	Teardown
    a.	Delete your service with cascade delete
    b.	Delete your cluster.
    c.	Navigate to EC2 in Console.
    d.	Delete anything that looks abnormal (Elastic IP)
    e.	Delete your registry in ECR
I recommend checking your billing the next day to ensure you don’t have any resources running still.
