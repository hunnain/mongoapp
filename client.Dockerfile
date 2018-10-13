FROM node:latest

RUN mkdir Client && \
    mkdir /Client/dist

COPY /dist /Client/dist
ADD ./webpack.config.js /Client
ADD ./package.json /Client
ADD ./index.html /Client
ADD /js /Client

RUN cd Client && \
    npm install http-server -g && \
    npm install && \
    npm run dev-build

EXPOSE 6565

CMD cd Client && \
    http-server -p 6565