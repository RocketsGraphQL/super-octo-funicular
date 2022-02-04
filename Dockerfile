FROM node:16.13.0
MAINTAINER Kaushik Varanasi "kaushik.varanasi1@gmail.com"

USER root

WORKDIR /app

COPY . .

CMD npm install
CMD npm run build
CMD npm run generate

# Expose ports
EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

# Set the default command to execute
# when creating a new container
CMD npm start
