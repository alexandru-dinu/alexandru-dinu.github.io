## Personal blog

Inspired by [Gregory Gundersen](http://gregorygundersen.com/)'s [blog theme](https://github.com/gwgundersen/blog-theme).

The `sources` branch contains code needed to build the final `_site` that only resides in the `master` branch.
This allows the usage of more custom plugins compared to the [default of GitHub pages](https://pages.github.com/versions/).
Instructions can be found [here](https://tiefenauer.github.io/blog/gh-pages-plugins/).

```
┌────────────────────┐     ┌──────────────────┐
│  branch: sources   │   ┌►│ branch: master   │
├────────────────────┤   │ ├──────────────────┤
│                    │   │ │  ./index.html    │
│      ./_posts      │   │ │  ./robots.txt    │
│         .          │   │ │  ./sitemap.xml   │
│         .          │   │ │  ...             │
│         .          │   │ └──────────────────┘
│      ./_site ──────┼───┘
│                    │
└────────────────────┘
```
