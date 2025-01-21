#!/bin/bash

# setup directory
mkdir -p /var/www/pelican-site
# output directory
mkdir -p /var/www/html/static-page

chmod -R 755 /var/www/pelican-site
chmod -R 755 /var/www/html/static-page


cd /var/www/pelican-site

# setup for pelicanconf.py
pelican-quickstart <<EOF
/var/www/pelican-site
Inception Static Page
root
en
y
https://albokanc.42.ft/static-page
n
Europe/Paris
n
EOF

echo "Pelican project has been created at /var/www/pelican-site."
echo "Static files will be output to /var/www/html/static-page."

# create content --> 
mkdir -p  /var/www/pelican-site/content/extra

mv /CV.html /var/www/pelican-site/content/extra/

# update pelicanconf.py
cat <<EOF >> /var/www/pelican-site/pelicanconf.py
OUTPUT_PATH = '/var/www/html/static-page/'
STATIC_PATHS = ['extra']
EXTRA_PATH_METADATA = {
    'extra/CV.html': {'path': 'CV.html'},
}
EOF

# convert content into HTML 
pelican /var/www/pelican-site/content

pelican --listen --bind 0.0.0.0 /var/www/pelican-site/output
