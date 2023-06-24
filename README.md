# docker-voyant

A dockerised version of [Voyant Server](https://github.com/voyanttools/VoyantServer), an incredibly useful digital humanities tool.

While Voyant Server is already built to run on a local machine, it depends on locally installed Java and Eclipse Jetty. 

Not everyone can or wants to install these dependencies direclty on their computer, or they might need different Java versions for different applications they're running. 

One way of avoiding this is running software as [Docker](https://www.docker.com/) applications.

A dockerised version of VoyantServer might be useful for researchers, teachers, and students who want to use a local version with few to none side effects and dependencies. 

## How to Turn This Thing On?

### Installing Docker

If you haven't already, install [Docker](https://docs.docker.com/get-docker/). 

(In case you very much distrust Microsoft and want to keep things as free as possible, you can also go for [Podman](https://podman.io/docs/installation).)

In the following steps I assume you have Docker installed and running.

### Building the Docker Image

There will be no pre-built images provided by me. You can easily build the image yourself, however.

```bash
docker build -t docker-voyant .
```

This will take a few minutes.

Docker downloads the Tomcat image [tomcat:9-jre11](https://hub.docker.com/layers/library/tomcat/9-jre11/images/sha256-aa33ee99685f00a3553a97e414b3d821537f73af987c411c43ccd87eb2d66753), installs some additional packages, and add some folders.

It also downloads a [release archive](https://github.com/voyanttools/VoyantServer/releases) of Voyant Server and prepares the content for running in Tomcat.

You only need to do this once (unless you want to change the version of Voyant Server that's running inside the container).

If you want to see which version of Voyant Server is used, have a look at the `VERSION_DOTTED` and `VERSION_UNDERSCORED` `ARG` variables in the Dockerfile.

If you want to change the version, change the values of these variables before (re-)building the Docker image (you can also use the `--build-arg` [parameter](https://docs.docker.com/engine/reference/builder/#arg)).


### Starting the Docker Application

Once you have built the Docker image, it is locally available on your machine.

To start the application, you can either run 

```bash
docker run -dit --rm --name voyant -p 80:8080 docker-voyant
```

or use `docker compose` (if you have it installed)

```bash
docker compose up -d
```

Once the application is running, you can access Voyant Server via your browser at `http://localhost`.

For more details on how to start, stop, and destroy applications, have a look at the [Docker CLI reference](https://docs.docker.com/engine/reference/commandline/cli/).

Feel free to modify your local Docker and Docker compose files according to your needs.

## Version Restrictions

As per the [original docs](https://github.com/voyanttools/VoyantServer#java-version) I restricted the Java version to 11. 

The Tomcat version had to be restricted to 9, higher versions throw errors.

## License

All files in this repository are released under General Public License v3.0, same as [Voyant Server itself](https://github.com/voyanttools/VoyantServer#license).
