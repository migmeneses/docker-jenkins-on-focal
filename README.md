# docker-jenkins
The Dockerfile will build an image using the official jenkins image with docker installed

If the host machine/hypervisor is running focal ubuntu ( 20.04 ) as OS, it will assign GID 998 instead of 999.
That will cause a permission issue on the user jenkins for running docker commands,
so we changed to 998 in order to solve this issue
