### Build image ###
```bash
docker build ./ -t php:php-cli
```

### Usage (run as ROOT Privilege) ###
```bash
echo "exec docker run --rm -i \
    -v \$PWD:/code \
    -v /tmp:/tmp \
    -v /opt:/opt \
    -v /home:/home \
    -w /code \
    php:php-cli php \"\$@\"" > /usr/local/bin/php
echo "exec docker run --rm -i \
    -v \$PWD:/code \
    -v /tmp:/tmp \
    -v /opt:/opt \
    -v /home:/home \
    -w /code \
    php:php-cli phpcs \"\$@\"" > /usr/local/bin/phpcs
echo "exec docker run --rm -i \
    -v \$PWD:/code \
    -v /tmp:/tmp \
    -v /opt:/opt \
    -v /home:/home \
    -w /code \
    php:php-cli phpcfb \"\$@\"" > /usr/local/bin/phpcfb
```
### test ###
```bash
php -v
phpcs --version
phpcfb --version
```
