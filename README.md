# JavaCC Dockerfile 

This repository contains a `Dockerfile` that builds an image for the OpenJDK and [JavaCC](https://javacc.github.io/javacc/). 

## Building

To build the image, simply run e.g. `docker image build -t javacc-docker/7.0.5 .` command. The resulting image will be tagged with `javacc-docker/7.0.5`.

## Usage

You can run `javacc` in the image by invoking the following:

```bash
docker run javacc-docker/7.0.5 java -cp javacc-7.0.5.jar javacc
```

This will print the usage instructions to the standard output. A more realistic usage is probably the following which assumes that the parser specification named `Assignment.jj` is located in a directory at `/path/to/sources` which is mounted into the docker image:

```bash
docker run -v /path/to/sources:/src javacc-docker/7.0.5 java -cp javacc-7.0.5.jar javacc -OUTPUT_DIRECTORY=/src/ /src/Assignment.jj
```

The output from `javacc` will be written to the mounted folder and the output will therefore be available outside of the container.