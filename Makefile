build: install
	bundle exec jekyll build

run: install
	bundle exec jekyll serve

install:
	bundle install --jobs 4
