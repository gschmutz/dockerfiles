# Oracle Stream Analytics (12c) on Docker

This is a Dockerfile for [Oracle Stream Analytics 12c](http://www.oracle.com/technetwork/middleware/complex-event-processing/overview/index.html). The purpose of this Docker container is to facilitate the setup of development and integration testing environments for developers.

**IMPORTANT**: Oracle **does not support Docker** in any environment, including but not limited to Development, Integration, and Production environments.

## How to build and run
This project offers sample Dockerfiles for Oracle Stream Analytics 12c (12.2.1), and for each version it also provides at least one Dockerfile for the 'standalone' distribution and a second Dockerfile for the 'spark' distribution (not yet available), as well more if necessary. To assist in building the images, you can use the [buildDockerImage.sh](dockerfiles/buildDockerImage.sh) script. See below for instructions and usage.

The `buildDockerImage.sh` script is just a utility shell script that performs MD5 checks and is an easy way for beginners to get started. Expert users are welcome to directly call `docker build` with their prefered set of parameters.

### Building Oracle Stream Analytics Docker Install Images
**IMPORTANT:** you have to download the binary of Oracle Stream Analytics and put it in place (see `.download` files inside dockerfiles/<version>).

Before you build, choose which version and distribution you want to build an image of, then download the required packages (see .download files) and drop them in the folder of your distribution version of choice. Then go into the **dockerfiles** folder and run the **buildDockerImage.sh** script as root.

	$ sh buildDockerImage.sh -h
	Usage: buildDockerImage.sh -v [version] [-A | -B] [-s] [-c]
	Builds a Docker Image for Oracle Stream Analytics.
  
	Parameters:
	   -v: version to build. Required.
	       Choose one of: 12.2.1  
	   -A: creates image based on 'standalone' distribution
	   -B: creates image based on 'spark' distribution (not yet available)
	   -c: enables Docker image layer cache during build
	   -s: skips the MD5 check of packages

	* select one distribution only: -A or -B
        
        LICENSE CDDL 1.0 + GPL 2.0
        
        Copyright (c) 2014-2015 Oracle and/or its affiliates. All rights reserved.

**IMPORTANT:** the resulting images will NOT have a domain pre-configured. You must extend the image with your own Dockerfile. You might take a look at the use case samples as well below.

## Samples for Oracle Stream Analytics Domain Creation
To give users an idea on how to create a domain from a custom Dockerfile to extend the Oracle Stream Analytics image, we provide a few samples for 12c versions for the Standalone distribution. For an example on **12.2.1**, you can use the sample inside [samples/1221-domain](samples/1221-domain) folder. 

### Sample Domain for Oracle Stream Analytics 12.2.1
This [Dockerfile](samples/1221-domain/Dockerfile) will create an image by extending **oracle/oracle-osa:12.2.1-standalone**. It will configure a **osa_domain** with the following settings:

 * Username: `osaadmin`
 * Password: provided by `ADMIN_PASSWORD` 
 * WebLogic Domain Name: `osa_domain`
 * Admin Server on port: `9002`

Make sure you first build the Oracle Stream Analytcis 12.2.1 Image with **-A** to get the Standalone Image.

## Building a sample Docker Image of a Oracle Stream Analytics Domain
To try a sample of a Oracle Stream Analytics image with a domain configured, follow the steps below:

  1. Make sure you have **oracle/oracle-osa:12.2.1-standalone** image built. If not go into **dockerfiles** and call 

        $ sh buildDockerImage.sh -v 12.2.1 -A

  2. Go to folder **samples/1221-domain**
  3. Run the following command: 

        $ docker build -t 1221-domain --build-arg OSA_PASSWORD=<define> .

  4. Verify you now have this image in place with 

        $ docker images

### Running Oracle Stream Analytics server
To start the Oracle Stream Analytics server, you can simply call **docker run -d 1221-domain** command. The sample Dockerfile defines **startwlevs.sh** as the default CMD.

    $ docker run -d --name=osa -p 9002:9002 1221-domain

Now you can access the Oracle Stream Analytics Web Console at [http://localhost:9002/sx](http://localhost:9002/sx).

## License
To download and run Oracle Stream Analytics 12c Distribution regardless of inside or outside a Docker container, and regardless of the distribution, you must download the binaries from Oracle website and accept the license indicated at that page.

To download and run Oracle JDK regardless of inside or outside a Docker container, you must download the binary from Oracle website and accept the license indicated at that pge.

All scripts and files hosted in this project and GitHub repository required to build the Docker images are, unless otherwise noted, released under the Common Development and Distribution License (CDDL) 1.0 and GNU Public License 2.0 licenses.

For all the scripts, the work of Oracle on docker for weblogic has been taken as a base and adapted accordingly.

## Copyright
Copyright (c) 2016 Trivadis and/or its affiliates. All rights reserved.
