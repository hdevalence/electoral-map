# TODO: add target to build the database

all:

build:
	mkdir -p _site
	rsync -avP dist geojson js index.html _site

clean:
	rm -rf _site

deploy:
	#TODO: gzip files
	s3cmd sync _site/ s3://www.hdevalence.ca/etc/electoralmap/ \
		--add-header='Cache-Control':'public, max-age 2592000' --guess-mime-type

help:
	echo "Targets: build deploy"
