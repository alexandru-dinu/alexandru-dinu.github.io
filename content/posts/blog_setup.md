+++
title = "Blog Setup"
date = "2025-09-19"
draft = false
tags = ["how-to"]
+++

# Setup

[This repo](https://github.com/alexandru-dinu/alexandru-dinu.github.io) is organised with two branches: the [main branch][1] contains code needed to build the final site
which resides in the [gh-pages branch][2], following instructions from [here](https://tiefenauer.github.io/blog/gh-pages-plugins/):
```
┌──────────────┐    ┌──────────────────┐
│ branch: main │  ┌►│ branch: gh-pages │
├──────────────┤  │ ├──────────────────┤
│ ./content    │  │ │  ./index.html    │
│ ...          │  │ │  ./sitemap.xmp   │
│ ./public ────┼──┘ │  ...             │
└──────────────┘    └──────────────────┘
```
Essentially, the `public/` directory is a new git repo with the same remote as the main repo, but pointing to the `gh-pages` branch.

In the GitHub repo settings, under "Page", you have to set the branch from which the site is being built, in my case: `gh-pages`.

For site generation, I am using [hugo](https://gohugo.io/) with the [hugo-coder](https://github.com/luizdepra/hugo-coder) theme.

Instead of dealing with Go and hugo installation locally, I use a [docker image](https://hub.docker.com/r/hugomods/hugo) which provides `hugo` and allows me to `serve` and `build` and the blog. This is defined in the [Justfile](https://github.com/alexandru-dinu/alexandru-dinu.github.io/blob/main/Justfile):
```
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
```

When I'm ready to push the built site to the `gh-pages` branch, I _just_ use the `push` rule.

[1]: https://github.com/alexandru-dinu/alexandru-dinu.github.io/tree/main
[2]: https://github.com/alexandru-dinu/alexandru-dinu.github.io/tree/gh-pages

# Example

This section tests various writing features of the blog's theme.

## Markdown

This is a quote `block`:

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dolor neque, egestas ut porta in, lacinia ac nibh. Nulla vehicula vehicula massa in ultricies. Aliquam rhoncus luctus tincidunt. **Aliquam** facilisis nibh erat, eget tincidunt risus vehicula a. Duis lacinia velit vel leo lacinia, nec dignissim augue accumsan. Donec aliquam fermentum suscipit. Quisque imperdiet urna ligula, ut vulputate augue rhoncus id. Integer sed arcu maximus, faucibus mauris blandit, imperdiet est.

#### To do
- [x] check this
- [ ] find nice content to add
- [ ] add citations

## Maths

- Here's [Euler's identity](https://en.wikipedia.org/wiki/Euler%27s_identity) in `inline-mode`:
$e^{i \pi} + 1 = 0$.
- Here's [Gaussian integral](https://en.wikipedia.org/wiki/Gaussian_integral) in `display-mode`:

$$
\int_{0}^{\infty} e^{-x^2} \mathrm{d}x = \dfrac{\sqrt{\pi}}{2}
$$


## Code

Here's some Python code:
```python
class Foo:
    def __init__(self, *args, **kwargs):
        pass

if __name__ == "__main__":
    xs = [1, 2, 3]
    ys = map(lambda x: x + 1, xs)
    zs = sum(ys)
```

and some Haskell:
```haskell
fib :: Num a => [a]
fib = 1:1:zipWith (+) fib (tail fib)

take 10 fib
-- [1,1,2,3,5,8,13,21,34,55]
```
