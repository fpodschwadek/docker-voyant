# Build: docker build -t docker-voyant .
FROM tomcat:9-jre11
ARG VERSION_DOTTED=2.6.7
ARG VERSION_UNDERSCORED=2_6_7
RUN apt-get update && apt-get install -y \
    unzip \
    ; \

    mkdir /tmp/voyant_release; \
    cd /tmp/voyant_release; \
    wget -O voyant.zip https://github.com/voyanttools/VoyantServer/releases/download/$VERSION_DOTTED/VoyantServer$VERSION_UNDERSCORED.zip; \
    unzip voyant.zip; \
    mkdir /usr/local/tomcat/webapps/ROOT; \
    mv VoyantServer$VERSION_UNDERSCORED/_app/* /usr/local/tomcat/webapps/ROOT/; \
    rm -rf VoyantServer$VERSION_UNDERSCORED; \
    rm voyant.zip
