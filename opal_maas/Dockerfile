FROM obiba/opal:4.6
COPY resource /opt/opal/data/
COPY first_run_addition.sh /opt/opal/bin/
COPY postinstall.sh /opt/opal/bin/
RUN chown opal /opt/opal/bin/first_run_addition.sh
RUN chown opal /opt/opal/bin/postinstall.sh
RUN chown -R opal /opt/opal/data
RUN chmod 755 /opt/opal/bin/first_run_addition.sh
RUN chmod 755 /opt/opal/bin/postinstall.sh
RUN echo  "/opt/opal/bin/first_run_addition.sh" >> /opt/opal/bin/first_run.sh
RUN echo  "mv /opt/opal/bin/first_run_addition.sh /opt/opal/bin/first_run_addition.sh.done"  >> /opt/opal/bin/first_run.sh
RUN sed -i 's/set_property "org.obiba.realm.url" "$AGATE_URL" "$OPAL_HOME\/conf\/opal-config.properties"/ set_property "org.obiba.realm.url" "$AGATE_URL" "$OPAL_HOME\/conf\/opal-config.properties"\n\tset_property "org.obiba.realm.service.key" "$AGATE_AUTH_KEY" "$OPAL_HOME\/conf\/opal-config.properties"/' /opt/opal/bin/start.sh






