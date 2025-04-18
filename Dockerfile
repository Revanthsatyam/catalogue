FROM    nodejs:18
RUN     useradd roboshop
USER    roboshop
RUN     mkdir /app
WORKDIR /app
COPY    schema package.json server.js /app/
ENV     MONGO=true
ENV     MONGO_URL="mongodb://docdbadmin:roboshop1234@prod-docdb-cluster.cluster-c0104uc8qq16.us-east-1.docdb.amazonaws.com:27017/catalogue"
CMD     ["node", "/app/server.js"]