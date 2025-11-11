#!/bin/bash
set_property () {
  field=$1
  value=$2
  file=$3
  tmpfile=/tmp/`basename ${file}`
  if grep -q ${field} ${file}
  then
    sed -r "s#${field}\s*=.*#${field}=${value}#g" ${file} | \
      sed -r "s/^#${field}=/${field}=/g" > ${tmpfile}
  else
    cat ${file} > ${tmpfile}
    echo "${field} = ${value}" >> ${tmpfile}
  fi
  mv ${tmpfile} ${file}
}
echo '{"name": "Opal","languages": ["en"],"defaultCharSet": "ISO-8859-1","enforced2FA": false,"allowRPackageManagement": true}' | opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT "/system/conf/general" --content-type="application/json"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT "/datashield/packages/_publish?profile=default&name=dsQueryLibraryServer&name=dsSwissKnife&name=resourcex&name=dsMOdual&name=dsMOprimal&name=dsBase&name=dsLCMM&name=dsImputation"
opal project -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name $PROJECT_NAME 
sleep 30
sed s/@host@/$POSTGRESDATA_HOST/g /opt/opal/data/resource.json | \
      sed s/@password@/$POSTGRESDATA_PASSWORD/g | \
      sed s/@user@/$POSTGRESDATA_USER/g | \
      sed s/@port@/$POSTGRESDATA_PORT/g | \
      sed s/@dbname@/$PROJECT_NAME/g | \
opal rest -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD -m POST /project/$PROJECT_NAME/resources --content-type "application/json"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/project/$PROJECT_NAME/permissions/resources?type=GROUP&permission=RESOURCES_VIEW&principal=$OPAL_PRIVILEGED_GROUP"
opal perm-datashield --opal http://localhost:8080 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD --type GROUP --subject $OPAL_PRIVILEGED_GROUP --permission use --add
