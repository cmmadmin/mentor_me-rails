FROM ubuntu:14.04
MAINTAINER paul@thestrongfamily.org

RUN apt-get update -q

RUN apt-get install -qy curl git build-essential

# Nokogiri dependencies
RUN apt-get install -qy libxslt-dev libxml2-dev

RUN ln -sf /proc/self/fd /dev/fd

# Install rvm, ruby, bundler
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 1.9.3-p448"
RUN /bin/bash -l -c "rvm use --default 1.9.3-p448"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Nokogiri dependencies
RUN apt-get install -qy libpq-dev

# ExecJS dependencies
RUN apt-get install -qy nodejs npm

WORKDIR /tmp 
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN /bin/bash -l -c "bundle install"

# Add rails project to project directory
ADD ./ /project

WORKDIR /project

EXPOSE 3000

CMD /bin/bash -l -c "bundle exec rails server"