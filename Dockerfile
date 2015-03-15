FROM ubuntu:14.04.2
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install curl unzip software-properties-common && apt-add-repository -y ppa:webupd8team/java && apt-get -y update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && apt-get -y install oracle-java8-installer

WORKDIR /ftb
RUN curl -L -O http://www.creeperrepo.net/FTB2/modpacks/FTBInfinity/1_2_1/FTBInfinityServer.zip \
&& unzip FTBInfinityServer.zip \
&& echo "eula=true" > /ftb/eula.txt \
&& chmod +x ServerStart.sh \
&& echo "Setup done"

EXPOSE 25565

VOLUME ["/ftb"]

CMD ["/ftb/ServerStart.sh"]
