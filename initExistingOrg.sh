#!/bin/bash

# Username parameter is optional
if [ "$#" -eq 0 ] 
then
	echo "No Org username or alias provided, will use current default"
else
	USERNAME=$1
    sfdx force:config:set defaultusername=$USERNAME
fi

./orgInitAndData.sh
