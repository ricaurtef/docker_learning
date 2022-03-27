# Commands Summary

Keep in mind: Containers only run as long as their main process.

Docker-generated names are a random adjective followed by the name of a famous
scientist, engineer, or hacker.


##  General Commands

__docker help__

This command will give you a full list of all of the Docker commands at your
disposal, along with a brief description of what each command does.

__docker info__

Information about your current docker installation.

__docker version__

Show the version of Docker installed on the system. \(It is also a way to
confirm that Docker is installed and running.\)


## Container-related Commands

__docker container run__

Run a command in a new container.

Use cases:

  - `docker container run -it IMAGE /bin/bash`
  - `docker container run -h HOSTNAME -it IMAGE COMMAND`
  - `docker container run --name NAME -d IMAGE`
  - `docker container run --rm --volumes-from CONTAINER -v $(pwd):/backup debian cp
/data/dump.rdb /backup`
  - `docker container run --rm -it --hostname="HOSTNAME" IMAGE COMMAND`
  - `docker container run -d -l KEY1=VALUE1 [-l KEYN=VALUEN] IMAGE`
  - `docker container run -it --dns=DNS1 --dns=DNS2 --dns-search=SEARCH IMAGE COMMAND`
  - `docker container run -it --mac-address=MAC IMAGE COMMAND`
  - `docker container run -it -v /path/host:/path/container[:ro] IMAGE COMMAND`
  - `docker container run -it --read-only=true -v /path/host:/path/container IMAGE
COMMAND`
  - `docker container run -it --read-only=true --tmpfs
/tmp:rw,noexec,nodev,nosuid,size=256M IMAGE COMMAND`
  - `docker container run -it --restart=on-failure:3 --memory=100m IMAGE
COMMAND`

__docker container inspect__

Display detailed information on one or more containers.

Use cases:

  - `docker container inspect  CONTAINER [CONTAINER...]`
  - `docker container inspect CONTAINER | grep -i ipaddress`
  - `docker container inspect --format {{.NetworkSettings.IPAddress}} CONTAINER`

__docker container diff__

Inspect changes to files or directories on a container's filesystem.

Use cases:

  - `docker container diff CONTAINER`

__docker container logs__

Fetch the logs of a container, i.e, a list of everything that has happened
inside the container.

Use cases:

  - `docker container logs CONTAINER`

__docker container commit__

Create a new image from a container's changes.

Use cases:

  - `docker container commit CONTAINER [REPOSITORY[:TAG]]`

__docker container rename__

Rename a container.

Use cases:

  - `docker container rename CONTAINER NEW_NAME`

__docker container pause|unpause__

Pause|unpause all processes within one or more containers.

Use cases:

  - `docker container pause CONTAINER`
  - `docker container unpause CONTAINER`

__docker container top__

Display the running processes of a container.

Use cases:

  - `docker container top CONTAINER`

__docker container exec__

Run additional processes inside a running container.

Use cases:

  - `docker container exec CONTAINER COMMAND`

__docker container port__

List port mappgings or a specific mapping for the container.

Use cases:

  - `docker container port CONTAINER`

__docker container update__

Update configuration of one or more containers.

Use cases:

  - `docker container update --cpus="1.5" CONTAINERS`
  - `docker container update --memory="512m" CONTAINERS`


## Image-related Commands

Note: Untagged images are reference as "dangling images".

__docker image rm__

Remove one or more images.

Use cases:

  - `docker image rm $(docker images -q -f 'dangling=true')`

__docker image history__

Provide a full list history of changes made to an image.

Use case:

  - `docker image history IMAGE`

__docker image inspect__

Display detailed information on one or moore images.

Use case:

  - `docker image inspect IMAGE`
  - `docker image inspect -f {{.Config.Labels}} IMAGE`

__docker image build__

Build an image from a Dockerfile.

Use case:

    - `docker image build --file PATH_DOCKERFILE -t|--tag REPOSITORY:TAG PATH`
    - `docker image build -t|--tag REPOSITORY:TAG PATH`

__docker image save__

Save one or more images to a tar archive \(streamed to STDOUT by default\).

Use case:

    - `docker image save -o TAR_FILE REPOSITORY:TAG


## Network-related Commands

__docker network__

Use cases:

  - `docker network ls`
