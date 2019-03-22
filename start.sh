#!/bin/sh

# Replace env vars in JavaScript files
echo "Replacing env vars in JS"
for file in /usr/share/nginx/html/_nuxt/*.js;
do
  echo "Processing $file ...";

  # Use the existing JS file as template
  if [ ! -f $file.tmpl.js ]; then
    cp $file $file.tmpl.js
  fi

  envsubst "$ENV_VARIABLES" < $file.tmpl.js > $file

  rm -f $file.tmpl.js
done

echo "Starting Nginx"
nginx -g 'daemon off;'