FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y git npm nodejs nginx
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g bower

# get git project and execute bower
RUN git clone https://github.com/HTWG-VirtualReality/prototyp.git
RUN cp -r prototyp/polymer/* /usr/share/nginx/html
WORKDIR "/usr/share/nginx/html"
RUN bower --allow-root update

# start nginx
CMD ["nginx"]

EXPOSE 80
EXPOSE 443
