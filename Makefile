build: check
	bundle exec jekyll build

run: check
	bundle exec jekyll serve

check:
	bundle check
