FROM node
WORKDIR /var/www/api

COPY ./wait-for-it.sh /var/www/api

# Expose the listening port of your app
EXPOSE 8989

RUN npm i -g pm2

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait /wait
RUN chmod +x /wait

CMD /wait && pm2-runtime start ecosystem.config.js
# CMD ["/wait", "pm2-runtime", "start", "ecosystem.config.js"]