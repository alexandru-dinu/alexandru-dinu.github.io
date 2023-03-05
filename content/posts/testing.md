---
title: "Testing"
date: 2021-05-31
draft: false
math: true
katex: true
---

This post tests various aspects of the blog's theme.

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

Here's some python code:

```python
class Foo:
    def __init__(self, *args, **kwargs):
        pass

if __name__ == "__main__":
    xs = [1, 2, 3]
    ys = map(lambda x: x + 1, xs)
    zs = sum(ys)
```
