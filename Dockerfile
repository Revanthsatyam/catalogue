FROM    node:18
RUN     mkdir /app
RUN     curl -o /app/global-bundle.pem https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
RUN     useradd -m roboshop
USER    roboshop
WORKDIR /app
COPY    node_modules/ /app/node_modules/
COPY    schema package.json server.js /app/
ENV     DOCUMENTDB=true
ENV     MONGO_URL="mongodb://docdbadmin:roboshop1234@prod-docdb-cluster.cluster-c0104uc8qq16.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&tlsCAFile=/app/global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false"
CMD     ["node", "/app/server.js"]