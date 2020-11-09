############################
# STEP 1 build executable binary
############################
FROM golang:alpine

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

WORKDIR $GOPATH/src/mypackage/myapp/
COPY . .

# Fetch dependencies.
RUN go get -u github.com/maxmind/geoipupdate/cmd/geoipupdate

# Using go get.
RUN go get -d -v

# Build the binary.
RUN go build -o /go/bin/app

# Install needed stuff
#RUN apt

# Copy our static executable.
RUN cp /go/bin/app /bin/app
RUN cp /go/bin/geoipupdate /bin/geoipupdate


# copy geoipupdate settings
RUN mkdir -p /usr/local/share/GeoIP
COPY GeoIP.conf /usr/local/etc/GeoIP.conf

# Update 
RUN chmod +x /bin/geoipupdate
RUN /bin/geoipupdate --verbose

#CMD ["app", "-db=/data/geodb.mmdb"]
#CMD ["app", "-db=/usr/local/share/GeoIP/GeoLite2-City.mmdb", "-listen=:80"]
# Run the hello binary.
CMD ["/bin/app", "-db=/usr/local/share/GeoIP/GeoLite2-City.mmdb", "-listen=:80"]
#CMD ["exit", "0"]

EXPOSE 80