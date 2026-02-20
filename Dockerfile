FROM node:20.19.5-alpine3.22 as build
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install



FROM node:20.19.5-alpine3.22
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server
EXPOSE 8080
LABEL com.project="roboshop" \
      component="catalogue" \
      author="bharathgaveni" 
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
COPY --from=build --chown=roboshop:roboshop /opt/server /opt/server
USER roboshop    
ENTRYPOINT ["node"]
CMD ["server.js"]