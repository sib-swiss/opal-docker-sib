#for i in ${ROCK_HOSTS//,/ }
#do
# acc="$acc,{\"host\":\"http://$i\"}"
#done
#rhosts=`echo $acc | cut -c2-`

#echo {token:\"$ROCK_OPAL_TOKEN\", rockConfigs:[$rhosts]}| curl -v --user "administrator:$OPAL_ADMINISTRATOR_PASSWORD" -X PUT http://localhost:8080/ws/apps/config -H 'Content-Type: application/json' -d @-
