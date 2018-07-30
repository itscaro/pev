FROM debian:stretch

RUN apt-get update && apt-get -y install apt-transport-https curl build-essential python ruby
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -y install nodejs

COPY tsdrc ~/.tsdrc
COPY . /app

WORKDIR /app

RUN npm install -g npm@latest gulp gulp-cli lite-server

RUN npm install && \
	npm run postinstall build.dev

ENTRYPOINT ["lite-server"]
CMD []