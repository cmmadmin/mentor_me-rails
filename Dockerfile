FROM cmmadmin/ruby-1.9.3:latest
MAINTAINER admin@mobilization.org

# RUN ln -sf /proc/self/fd /dev/fd

# Nokogiri dependencies
#ONBUILD RUN apt-get install -qy libxslt-dev libxml2-dev libpq-dev

# ExecJS dependencies
#RUN apt-get install -qy nodejs npm
WORKDIR /app
ADD config/database.yml.example /app/config/database.yml

EXPOSE 8080
