# TODO: add target to build the database

all:

geojson:
	mkdir -p _site/geojson
	./scripts/export_all_to_geojson.sh _site/geojson/

html:
	mkdir -p _site
	cp -av dist js index.html _site

clean:
	rm -rfv _site

deploy:
	#TODO: gzip files
	s3cmd sync _site/ s3://www.hdevalence.ca/etc/electoralmap/ \
		--add-header='Cache-Control':'public, max-age 2592000' --guess-mime-type

help:
	echo "Targets: build deploy"
