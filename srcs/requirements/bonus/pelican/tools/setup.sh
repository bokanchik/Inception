#!/bin/bash

# setup directory
mkdir -p /var/www/pelican-site
# output directory
mkdir -p /var/www/html/static-page
# create content --> 
mkdir -p  /var/www/pelican-site/content/
# contains all the templates that will be used to generate the content
mkdir -p /var/www/pelican-site/templates/

chmod -R 777 /var/www/pelican-site
chmod -R 777 /var/www/html/static-page

cd /var/www/pelican-site

# setup for pelicanconf.py
pelican-quickstart <<EOF
/var/www/pelican-site
Inception Static Page
root
en
y
https://albokanc.42.fr/static-page/
n
Europe/Paris
n
EOF

echo "Pelican project has been created at /var/www/pelican-site."
echo "Static files will be output to /var/www/html/static-page."


mv /cv.md /var/www/pelican-site/content/
mv /base.html /var/www/pelican-site/templates/


sed -i '/LINKS = (\|SOCIAL = (/,$s/^/#/' /var/www/pelican-site/pelicanconf.py
# update pelicanconf.py
cat <<EOF >> /var/www/pelican-site/pelicanconf.py
OUTPUT_PATH = '/var/www/html/static-page/'
STATIC_PATHS = ['content']
EXTRA_PATH_METADATA = {
    'content/cv.md': {'path': 'index.html'},}
EOF

rm -rf /var/www/html/static-page/*

# convert content into HTML 
pelican /var/www/pelican-site/content --output /var/www/html/static-page/ --settings /var/www/pelican-site/pelicanconf.py --delete-output

mv /cv.css /var/www/html/static-page/

chmod 644 /var/www/html/static-page/cv.css

sed -i 's|<link rel="stylesheet" href="/theme/css/main.css" />|<link rel="stylesheet" href="/static-page/cv.css?v=1.0" />|' /var/www/html/static-page/index.html

pelican --listen --bind 0.0.0.0 /var/www/pelican-site/output