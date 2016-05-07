sed -i -e "s/%username%/$OSA_USERNAME/g" /u01/oracle/silent.xml
sed -i -e "s/%password%/$OSA_PASSWORD/g" /u01/oracle/silent.xml
sed -i -e "s/%serverName%/$OSA_SERVER_NAME/g" /u01/oracle/silent.xml
sed -i -e "s/%domainName%/$OSA_DOMAIN_NAME/g" /u01/oracle/silent.xml
sed -i -e "s/%netioPort%/$OSA_PORT/g" /u01/oracle/silent.xml
sed -i -e "s!%domainLocation%!$OSA_DOMAIN_HOME!g" /u01/oracle/silent.xml
