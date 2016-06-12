# LICENSE CDDL 1.0 + GPL 2.0
#
# TRIVADS DOCKERFILES PROJECT
# ---------------------------
# This Dockerfile extends the Oracle Stream Analytics image by creating a sample domain.
#
# Credits to Bruno Borges who created the Docker Weblogic Dockerfile and where this Dockerfile is based on. 
# 
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run: 
#      $ docker build -t 1221-domain --build-arg OSA_PASSWORD=welcome1 .
#
# Pull base image
# ---------------
FROM gschmutz/oracle-osa:12.2.1-standalone

# Maintainer
# ----------
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

# WLS Configuration
# ----------------------------------------------------------
ARG OSA_PASSWORD
ENV OSA_DOMAIN_NAME="osa_domain" \
    OSA_DOMAIN_HOME="/u01/oracle/user_projects/domains" \
    OSA_USERNAME=${OSA_USERNAME:-osaadmin} \
    OSA_PASSWORD=${OSA_PASSWORD:-welcome1} \
    OSA_PORT=${OSA_PORT:-9002} \
    KEYSTORE_PASSWORD=${KEYSTORE_PASSWORD:-welcome1} \
    PRIVATEKEY_PASSWORD=${PRIVATEKEY_PASSWORD:-welcome1} \
    OSA_SERVER_NAME="osa_server" \
    DB_SERVER_NAME=${DB_SERVER_NAME:-db} \
    DB_SERVER_PORT=${DB_SERVER_PORT:-1521} \
    DB_USERNAME=${DB_USERNAME:-osa} \
    DB_PASSWORD=${DB_PASSWORD:-welcome1} \
    CONFIG_JVM_ARGS="-Dweblogic.security.SSL.ignoreHostnameVerification=true" \
    PATH=$PATH:/u01/oracle/osa12c/oep/common/bin:/u01/oracle/osa12c/oep/bin:/u01/oracle

ENV OSA_DOMAIN_DIR="${OSA_DOMAIN_HOME}/${OSA_DOMAIN_NAME}/${OSA_SERVER_NAME}"    

USER root
COPY container-scripts/* /u01/oracle/
RUN /u01/oracle/configure-silent.sh

# Add files required to build this image
USER oracle

# Configuration of OSA Domain
RUN config.sh -mode=silent -silent_xml=/u01/oracle/silent.xml -log=create_domain.log

# Expose OSA port
EXPOSE $OSA_PORT
WORKDIR $OSA_DOMAIN_DIR

# Define default command to start bash. 
CMD ["./startwlevs.sh"]
