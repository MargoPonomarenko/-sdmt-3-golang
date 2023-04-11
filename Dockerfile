FROM golang:latest AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o build/fizzbuzz .

FROM scratch

COPY --from=builder /app/build/fizzbuzz /

COPY --from=builder /app/templates/index.html templates/index.html 

EXPOSE 8080

CMD ["/fizzbuzz", "serve"]