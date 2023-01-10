# Package the game server (UE5+) in a docker image

This repo contains the Dockerfile template to package any UE5 server build
in a docker image.

## Usage

Copy the `LinuxServer` directory built from UE5 to the `artifact` dir.

Ensure the server entry script is named `server.sh`.

Run `build.sh <name:tag>`

`<name:tag>` is the docker image name + tag following the standard docker image
naming convention.

## Best Practices

Ensure the server build is lean. You should choose the build mode "shipping"
not "development".

Run `synx` on the resulting image to scan for security vulnerability

Since this image is based on the debian family, once a new release is out,
update the build script to use this new version that comes with the latest
security patches.

Debian release page: <https://www.debian.org/releases/>
