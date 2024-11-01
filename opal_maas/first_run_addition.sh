#!/bin/bash
/opt/opal/bin/postinstall.sh
opal project -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name $OPAL_PROJECT_NAME 
sed s/@host@/$POSTGRESDATA_HOST/g /opt/opal/data/resource | \
      sed s/@user@/$POSTGRESDATA_USER/g | \
      sed s/@password@/$POSTGRESDATA_PASSWORD/g | \
      sed s/@port@/$POSTGRESDATA_PORT/g | \
      sed s/@project_name@/$OPAL_PROJECT_NAME/g | \
      sed s/@resource_name@/$OPAL_RESOURCE_NAME/g | \
opal rest -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD -m POST /project/$OPAL_PROJECT_NAME/resources --content-type "application/json"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/project/$OPAL_PROJECT_NAME/permissions/resources?type=GROUP&permission=RESOURCES_VIEW&principal=$OPAL_PRIVILEGED_GROUP"
opal perm-datashield --opal http://localhost:8080 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD --type GROUP --subject $OPAL_PRIVILEGED_GROUP --permission use --add
