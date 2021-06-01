build:
	docker run --rm -it --volume="${PWD}:/srv/jekyll" blog jekyll $@

serve:
	docker run --rm -it --volume="${PWD}:/srv/jekyll" -p 6006:4000 blog jekyll $@
