FROM golang:1.14 as stage

WORKDIR /app
COPY . .
RUN make GOOS=linux GOARCH=amd64 CGO_ENABLED=0 FLAGS="-tags netgo"

FROM scratch 

WORKDIR /app

COPY --from=stage /app/main /app/genid