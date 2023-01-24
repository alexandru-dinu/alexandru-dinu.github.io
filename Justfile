set positional-arguments

image := "hugo:latest"

build-hugo-image:
    docker build . --tag {{image}}

@run *args='':
    docker run --rm -it \
        -u $(id -u):$(id -g) \
        -v `pwd`:/src \
        -p 1313:1313 \
        {{image}} \
        $@

build-site: run
