FROM postgres:latest
ENV PGDATA /sib/data
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA"
RUN mkdir -p /sib/conf/conf.d && chown -R postgres:postgres /sib/conf && chmod 777 /sib/conf
COPY pg_hba.conf /sib/conf/
RUN chown postgres:postgres /sib/conf/pg_hba.conf
RUN chmod 600 /sib/conf/pg_hba.conf
VOLUME "$PGDATA"
RUN mkdir /scripts
COPY *.sh /docker-entrypoint-initdb.d/
RUN chmod 777 /docker-entrypoint-initdb.d/*
COPY *.sql /scripts/
RUN chown -R postgres /scripts
