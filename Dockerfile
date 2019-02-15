FROM ruby:2.6.1

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

EXPOSE 2001

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]
