FROM crystallang/crystal as builder
WORKDIR /app
ADD . /app
RUN shards build

FROM crystallang/crystal
COPY --from=builder /app/bin/yakut /usr/bin/yakut
