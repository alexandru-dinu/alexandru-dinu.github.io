set positional-arguments

image := "hugomods/hugo:0.131.0"

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

push:
    (cd public/ \
        && git add . \
        && git commit -m "[$(date +'%Y-%m-%dT%H:%M:%S%:z')] rebuild site" \
        && git push -u origin gh-pages)
