FROM golang:latest

WORKDIR /app

COPY . .

RUN go build -o build/fizzbuzz
CMD ["./build/fizzbuzz", "serve"]