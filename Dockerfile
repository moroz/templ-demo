FROM golang:1.21.4-bookworm AS builder

WORKDIR /app

RUN go install github.com/a-h/templ/cmd/templ@latest

COPY go.mod go.sum ./

RUN go mod download

COPY . ./

RUN templ generate

RUN go build -o server

FROM debian:bookworm-slim AS runner

WORKDIR /app

COPY --from=builder /app/server /app/server

CMD /app/server
