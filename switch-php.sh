#!/bin/sh

# Switch PHP brew version on Mac OS X recieving the new version as parameter
# Example: switch-php.sh 5.6.10

# Check if the parameter is not empty
if [ -z "$1" ]
then
    echo "No PHP version specified"
    exit 1
fi

# Check if the parameter is a valid version.
if [[ ! $1 =~ ^[0-9]+(\.[0-9]+)*$ ]]
then
    echo "Invalid PHP version"
    exit 1
else 
    echo "Switching to PHP $1"
fi

# Switch PHP version
brew unlink php
brew link php@$1 --force

# Check PHP version
php -v | head -n 1
