set positional-arguments

image := "ghcr.io/gohugoio/hugo:v0.150.0"

# provides `hugo`
@run *args:
    docker run --rm -t \
        -u $(id -u):$(id -g) \
        -v `pwd`:/src \
        -p 1313:1313 \
        {{image}} \
        $@

serve:
    just run server --source /src --bind 0.0.0.0

build:
    just run build --source /src

push:
    (cd public/ \
        && git add . \
        && git commit -m "[$(date +'%Y-%m-%dT%H:%M:%S')] rebuild site" \
        && git push -u origin gh-pages)
