Example of Image with OSA Standalone Domain
===========================================
This Dockerfile extends the Oracle Stream Analytics image by creating a sample standalone domain.

# How to build and run
First make sure you have built **gschmutz/oracle-osa:12.2.1-standalone**. Now to build this sample, run:

        $ docker build -t 1221-domain  --build-arg OSA_PASSWORD=<define> .

To start the Oracle Stream Analytics Server, run:

        $ docker run -d --name=osa -p 9002:9002 1221-domain
