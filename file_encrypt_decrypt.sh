# Quickly encrypt and decrypt files using AES-CBC 256 bit + PBKDF2.
# The ciphertext is in base64 encoding and can be easily transmitted in text form in emals and messages.

function enc { openssl aes-256-cbc -a -pbkdf2 -in "$1" -out "$1".enc && rm "$1" }
function dec { dec_file_name=$(echo $1 | cut -d '.' -f 1,2);openssl aes-256-cbc -d -a -pbkdf2 -in "$1" -out "$dec_file_name" }

export enc
export dec
