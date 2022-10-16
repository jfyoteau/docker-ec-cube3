#!/bin/bash

cd /var/data/ec-cube
composer install
php eccube_install.php mysql none --skip-createdb --verbose
