FROM ubuntu:16.04

# install all needed software
RUN apt-get update
RUN apt-get install -y git npm nodejs nginx
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g bower
RUN rm -rf /var/lib/apt/lists/*

# get git project and execute bower
RUN git clone https://github.com/HTWG-VirtualReality/prototyp.git
RUN cp -r prototyp/polymer/* /usr/share/nginx/html
WORKDIR "/usr/share/nginx/html"
RUN bower --allow-root update

# start nginx
EXPOSE 80 443

COPY default.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
