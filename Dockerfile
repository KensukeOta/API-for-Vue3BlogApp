FROM ruby:3.1.2

WORKDIR /data
COPY Gemfile /data/Gemfile
COPY Gemfile.lock /data/Gemfile.lock
RUN bundle install
COPY . /data

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8080

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
