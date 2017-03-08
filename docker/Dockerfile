FROM elixir:1.4.2

MAINTAINER Paul Lamb 

ENV REFRESHED_AT 2017-03-07
# 2017-03-07 update to elixir 1.4.2 and for gccb
# 2017-01-15 update to elixir 1.4.0

# Install hex & rebar
RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force && \
    /usr/local/bin/mix hex.info

CMD ["bash"]