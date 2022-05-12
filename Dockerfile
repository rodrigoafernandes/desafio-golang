FROM docker.io/library/golang:1.17.1-alpine AS build
WORKDIR /go/src
COPY . /go/src/
RUN CGO_ENABLED=0 go build -a -installsuffix cgo -o /go/bin/codeeducation

FROM scratch
COPY --from=build /go/bin/codeeducation /usr/local/bin/
CMD ["codeeducation"]