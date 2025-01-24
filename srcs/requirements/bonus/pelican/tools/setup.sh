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
mkdir -p  /var/www/pelican-site/content/pages/
mkdir -p  /var/www/pelican-site/themes/static/css/

mv /cv.md /var/www/pelican-site/content/pages/
mv /cv.css /var/www/pelican-site/themes/static/css/

# update pelicanconf.py
cat <<EOF >> /var/www/pelican-site/pelicanconf.py
OUTPUT_PATH = '/var/www/html/static-page/'
STATIC_PATHS = ['pages', 'static']
EXTRA_PATH_METADATA = {
    'static/css/cv.css': {'path': 'cv.css'},
    'pages/cv.md': {'path': 'index.html'},
}
ARCHIVES_SAVE_AS = ""
AUTHOR_SAVE_AS = ""
AUTHORS_SAVE_AS = ""
CATEGORY_SAVE_AS = ""
CATEGORIES_SAVE_AS = ""
TAGS_SAVE_AS = ""

EOF

# convert content into HTML 
pelican /var/www/pelican-site/content

pelican --listen --bind 0.0.0.0 /var/www/pelican-site/output