Earlier all microservice is defined to run under tf/main.tf

We have re-factor it because if we want to test any specific
micro service then we won't be able to do it.

we created files like below 

backend.tf have details of where state file will save.
provider.tf have details of plugin need to run resources.
production.tf
development.tf
staging.tf

added staging details in docker-compose.yml
