#!/bin/bash

RAND="$(echo -n "#" && openssl rand -base64 12 | tr -dc a-zA-Z0-9 | head -c 6)"

echo $RAND

echo 'request 1'
curl 'https://dev.staticman.net/v2/entry/GatsbyCentral/staticman-test2/master/comments99' -H 'content-type: application/x-www-form-urlencoded' --data "options%5Bslug%5D=1306&fields%5Bname%5D=John+Doe&fields%5Bemail%5D=jd%40mailinator.com&fields%5Bmessage%5D=${RAND}---1 A+message+today%2C+13+Jun&fields%5Bfoo%5D=foo&fields%5Bbar%5D=bar" &


echo 'request 2'
curl 'https://dev.staticman.net/v2/entry/GatsbyCentral/staticman-test1/master/comments' -H 'origin: https://gatsbycentral.github.io' -H 'content-type: application/x-www-form-urlencoded' -H 'referer: https://gatsbycentral.github.io/staticman-test1/' --data "options%5Bslug%5D=20180613&fields%5Bname%5D=John+Doe&fields%5Bemail%5D=jd%40mailinator.com&fields%5Bmessage%5D=${RAND}---2 t444" &
