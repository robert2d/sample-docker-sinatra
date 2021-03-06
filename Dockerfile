
FROM phusion/passenger-ruby22

MAINTAINER Dave Robertson <david.robertson@crichq.com>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Expose Nginx HTTP service
EXPOSE 80
#  Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

ADD nginx.conf /etc/nginx/sites-enabled/webapp.conf

# Install bundle of gems
WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle install --jobs 8

# Add the app
ADD . /app
RUN chown -R app:app /app

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/local/bin/foreman","start","-d","/app"]
