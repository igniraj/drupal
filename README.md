docker build -t website-cms .


docker build -t myimage .

docker run -d --name mycontainer -p 8080:80 myimage

docker run -it --entrypoint /bin/bash <image_name>

service nginx status

cat 
docker build -t website-cms .
docker run -d --name mycontainer -p 8080:80 website-cms
docker exec -it 34f88a54085a sh


docker rm cont1, conta2

docker exec -it 984a4f44138f bash

docker run -d --name mycontainer -p 8080:80 website-cms
docker cp /path/to/info.php <container_id_or_name>:/var/www/html/info.php
docker cp C:/xampp/htdocs/walaa_test/phpinfo.php 770b0a043d55:/var/www/html/phpinfo.php

new comments
docker build -t my_php_nginx .
docker run -p 80:80 my_php_nginx
