FROM debian:jessie as builder

# ENV VER     3.0.0
ENV VER     7.0.2
ENV TARBALL http://download.redis.io/releases/redis-$VER.tar.gz

RUN echo "==> Install curl and helper tools..."  && \
  apt-get update                      && \   
  apt-get install -y  curl make gcc   && \  
  echo "==> Download, compile, and install..."  && \  
  curl -L $TARBALL | tar zxv  && \   
  cd redis-$VER               && \   
  make                        && \   
  make install                && \   
  echo "==> Clean up..."  && \   
  apt-get remove -y --auto-remove curl make gcc  && \
  apt-get clean                                  && \   
  rm -rf /var/lib/apt/lists/*  /redis-$VER

# ENTRYPOINT ["/usr/local/bin/redis-server"]
# CMD ["--help"]

# 精简的生成环境
FROM scratch
# FROM debian:jessie as dev
COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY --from=builder /usr/lib/ /usr/lib/
COPY --from=builder /lib64/ /lib64/
COPY --from=builder /lib/ /lib/
# COPY --from=builder /bin/ /bin/
# ENTRYPOINT ["/usr/local/bin/redis-server"]
CMD ["/usr/local/bin/redis-server", "--help"]

