---
title: "Blog Setup"
date: 2023-02-03T20:29:54Z
draft: false
tags: ["how-to"]
---

# How to

I recently moved my blog from Jekyll to Hugo. It wasn't a particularly hard decision to make as I was not dependent of any of Jekyll features.
I just want a simple to configure & minimalistic setup.

I am using a Hugo docker image:
```
FROM klakegg/hugo:debian

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y git
```
