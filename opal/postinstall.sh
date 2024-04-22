#!/bin/bash

opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/dsSwissKnife&ref=master"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/resourcex&ref=master"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/dsQueryLibraryServer&ref=main"
opal rest /datashield/package/dsSwissKnife/_publish?profile=default --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
opal rest /datashield/package/resourcex/_publish?profile=default --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
opal rest /datashield/package/dsQueryLibraryServer/_publish?profile=default --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD  --method POST "/permissions/datashield?type=GROUP&permission=DATASHIELD_USEW&principal=$OPAL_PRIVILEGED_GROUP"
