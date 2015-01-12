FROM golang

MAINTAINER Erick Dransch <ekgdrans@uwaterloo.ca>

RUN apt-get update && apt-get install --no-install-recommends -y bzr

RUN go get github.com/spf13/hugo

VOLUME ["/usr/share/nginx/html"]

ENV HUGO_BASE_URL http://erickdransch.com

#CMD ["hugo", "-w", "-b", "", "-s", "/src", "-d", "/usr/share/nginx/html", "--buildDrafts", "--theme=hyde"]
CMD hugo -w -b ${HUGO_BASE_URL} -s /src -d /usr/share/nginx/html --buildDrafts --theme=hyde
