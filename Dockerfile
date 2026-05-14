FROM ruby:3.4.9-slim

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libyaml-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 8080

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "8080"]
