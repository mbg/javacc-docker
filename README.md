# JavaCC Dockerfile 

This repository contains a `Dockerfile` that builds an image for the OpenJDK and [JavaCC](https://javacc.github.io/javacc/). The image is [published on GitHub](https://github.com/mbg/javacc-docker/packages/162251) and can be obtained by running e.g.:

```bash
docker pull docker.pkg.github.com/mbg/javacc-docker/javacc:latest 
```

Versions `7.0.5` (`latest`) and `7.0.4` are available.

## Building

If you wish to build the image locally after cloning the repository, simply run e.g. `docker image build -t javacc-docker:latest .` command. The resulting image will be tagged with `javacc-docker:latest` and will use version `7.0.5` of JavaCC by default. You can explicitly specify the JavaCC version to use by adding `--build-arg JAVACC_VERSION=7.0.5` to the build command.

## Usage

You can run `javacc` in the image by invoking the following:

```bash
docker run docker.pkg.github.com/mbg/javacc-docker/javacc:latest
```

This will print the usage instructions to the standard output. A more realistic usage is probably the following which assumes that the parser specification named `Assignment.jj` is located in a directory at `/path/to/sources` which is mounted into the docker image:

```bash
docker run -v /path/to/sources:/src docker.pkg.github.com/mbg/javacc-docker/javacc:latest -OUTPUT_DIRECTORY=/src/ /src/Assignment.jj
```

The output from `javacc` will be written to the mounted folder and the output will therefore be available outside of the container.