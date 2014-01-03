#!/bin/bash

load_profile_hook () {
    if [ ! -f $JAMOORA_PROFILES/$1/aws-config ]
    then 
	echo "AWS config $1 doesn't exist" 
        return 1
    fi

    if [ ! -f $JAMOORA_PROFILES/$1/ssh-config ]
    then 
	echo "SSH config for $1 doesn't exist at $JAMOORA_PROFILES/$1/jamoora/ssh-config" 
    else
        cat ~/.ssh/config.default $JAMOORA_PROFILES/$1/ssh-config > $HOME/.ssh/config
    fi

    export AWS_ACCESS_KEY_ID=`cat $JAMOORA_PROFILES/$1/aws-config | jq -r '.AWS_ACCESS_KEY_ID'`
    export AWS_SECRET_ACCESS_KEY=`cat $JAMOORA_PROFILES/$1/aws-config  | jq -r '.AWS_SECRET_ACCESS_KEY'`
}

load_profile_hook $1


