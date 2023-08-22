set positional-arguments

image := "hugomods/hugo:go-git"

@run *args:
    docker run --rm -t \
        -u $(id -u):$(id -g) \
        -v `pwd`:/src \
        -p 1313:1313 \
        {{image}} \
        $@

serve:
    just run hugo server --bind 0.0.0.0

build:
    just run hugo
