generate_passwd () 
{ 
    HOW_MANY=${1:-1};
    LENGTH=${2:-24};
    for ((i=0; i<$HOW_MANY; i++))
    do
        cat /dev/urandom | base64 | tr -d 'iI1lLoO0+/g7' | head -c${LENGTH};
        echo;
    done
}

