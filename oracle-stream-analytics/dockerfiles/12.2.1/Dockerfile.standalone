# LICENSE CDDL 1.0 + GPL 2.0
#
# TRIVADS DOCKERFILES PROJECT
# ---------------------------
# This is the Dockerfile for Oracle Stream Analytics 12.2.1 (Full) Generic Distribution
#
# Credits to Bruno Borges who created the Docker weblogic Dockerfile and where this Dockerfile is based on. 
# 
# REQUIRED BASE IMAGE TO BUILD THIS IMAGE
# ---------------------------------------
# Make sure you have oraclelinux:7.0 Docker image installed.
# Visit for more info: 
#  - http://public-yum.oracle.com/docker-images/
#
# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# Download the following files and place them into the downloads subfolder
#
# (1) ofm_integration_osa_12ofm_integration_osa_12.2.1.0.0_disk1.zip
#     Download the Oracle Stream Analytics Runtime from http://www.oracle.com/technetwork/middleware/complex-event-processing/downloads/index.html
#
# (2) server-jre-8u91-linux-x64.tar.gz
#     Download JDK from http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files into the downloads sub-directory.
# To build the image, run: 
#      $ docker build -t gschmutz/oracle-osa:12.2.1 . 
#
# IMPORTANT
# ---------
# The resulting image of this Dockerfile DOES NOT contain a OSA Domain.
# For that, look into the folder 'samples' for an example on how
# to create a domain on a new inherited image.
#
# You can go into 'samples/1221-domain' after building the OSA install image
# and build the domain image, for example:
# 
#   $ cd samples/1221-domain
#   $ docker build -t osa -build-arg OSA_PASSWORD=<define> .
#
# Pull base image
# ---------------
FROM oraclelinux:latest

# Maintainer
# ----------
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------
ENV JAVA_PKG=server-jre-8u*-linux-x64.tar.gz \
	JAVA_HOME=/usr/java/default \
    PATH=$PATH:/usr/java/default/bin \
    ORACLE_HOME=/u01/oracle \
    OSA_PKG=fmw_12.2.1.1.0_osa_Disk1_1of1.zip \
    OSA_JAR=fmw_12.2.1.1.0_osa.jar \
    OSA_FOLDER=fmw_12.2.1.1.0_osa_Disk1_1of1

# Install and configure Java
# --------------------------
ADD downloads/$JAVA_PKG /usr/java/
RUN mv $(ls -1 -d /usr/java/*) $JAVA_HOME 

# Copy packages
# -------------
COPY downloads/$OSA_PKG setup/install.file setup/oraInst.loc /u01/


# Setup filesystem and oracle user
# Install and configure Oracle JDK
# Adjust file permissions, go to /u01 as user 'oracle' to proceed with WLS installation
# ------------------------------------------------------------
RUN chmod a+xr /u01 && \
	useradd -b /u01 -m -s /bin/bash oracle && \
	echo oracle:oracle | chpasswd && \
	cd /u01 && $JAVA_HOME/bin/jar xf /u01/$OSA_PKG && cd - && \
	su -c "$JAVA_HOME/bin/java -jar /u01/$OSA_JAR -silent -responseFile /u01/install.file -invPtrLoc /u01/oraInst.loc -jreLoc $JAVA_HOME" - oracle && \
    chown oracle:oracle -R /u01 && \
    rm /u01/$OSA_JAR /u01/$OSA_PKG /u01/oraInst.loc /u01/install.file

USER oracle
WORKDIR $ORACLE_HOME 

# Define default command to start bash. 
CMD ["bash"]
