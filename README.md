This project aims to benchmark how a polling proxy server perform when forwarding reqeusts to another slow response server using IO multiplexing architecture.

## Start Server

```
docker-compose up --build
```

It starts 2 servers:

1. slow response server - with 20-second response time.
2. polling proxy - forwrad reqeust to slow response server and respond instantly with the the format in `{"state":"pending"}` or `{"state":"done"}`.

## Usage

```sh
curl 'http://localhost:3000?task_id=123'
```

output for first time:

```
{"state":"pending"}
```

output after 20 seconds using the same `task_id`:

```
{"state":"done","result":"ok"}
```

## Benchmark

TL;DR: One single thread can handle approximately 2.5k concurrent clients.

Run the following command to benchmark:

```sh
./benchmark
```

example output:

```
Running 10s test @ http://polling-proxy:3000
  8 threads and 10000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   280.47ms  117.21ms   1.70s    92.09%
    Req/Sec   362.93    419.94     2.02k    83.68%
  25179 requests in 10.09s, 2.72MB read
  Socket errors: connect 0, read 0, write 0, timeout 29
Requests/sec:   2494.44
Transfer/sec:    275.55KB
```
