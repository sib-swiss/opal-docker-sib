# SIB generic docker images for opal and postgresql

The yml folder contains example docker-compose configuration for 
1) the postgresql database and
2) the opal and rock servers.


First set the variables in the setvars file to the desired values, then export them in the environment.

<code>. ./setvars</code>

Then run <code>docker-compose up -d</code> first in the yml/postgres folder (this will install a postgres database populated with an empty OMOP schema) and then in the yml/opal folder.
