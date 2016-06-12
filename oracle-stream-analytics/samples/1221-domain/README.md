Example of Image with OSA Standalone Domain
===========================================
This Dockerfile extends the Oracle Stream Analytics image by creating a sample standalone domain.

# How to build 
First make sure you have built **gschmutz/oracle-osa:12.2.1-standalone**. Now to build this sample, run:

        $ docker build -t 1221-domain  --build-arg OSA_PASSWORD=<define> .

The build argument OSA_PASSWORD can be used to specifiy the password. Here are all the different arguments supported:

| build-arg   | description  | value  |
|---|---|---|
| OSA_USERNAME  | the name of the OSA admin user  | osaadmin  |
| OSA_PASSWORD  | the password for the OSA admin user  | welcome1  |
| OSA_PORT  | the Port OSA will listen to  | 9002  |
| KEYSTORE_PASSWORD  | the password for the Oracle Stream Analytics identity keystore  | welcome1  |
| PRIVATEKEY_PASSWORD  | the password for the certificate private key  | welcome1  |
| DB_SERVER_NAME  | the name of the database instance to be used to configure the data source.   | db  |
| DB_SERVER_PORT  | the port of the database instance to be used to configure the data source.  | 1521  |
| DB_SERVER_SERVICE  | the servicename of the database instance be used to configure the data source.   | xe  |
| DB_USERNAME  | the name of the user that connects to the database instance.  | osa  |
| DB_PASSWORD  | the password of the user that connects to the database instance.  | welcome1  |

# How to run
To start the Oracle Stream Analytics Server, run:

        $ docker run -d --name=osa -p 9002:9002 1221-domain
