#!/bin/sh -l

echo "Processing..."
echo "$INPUT_PROFILE" > input.xml
ftpURL=$(xmllint --xpath 'string((//publishData/publishProfile[@publishMethod = "FTP"])[1]/@publishUrl)' input.xml)
userName=$(xmllint --xpath 'string((//publishData/publishProfile[@publishMethod = "FTP"])[1]/@userName)' input.xml)
userPWD=$(xmllint --xpath 'string((//publishData/publishProfile[@publishMethod = "FTP"])[1]/@userPWD)' input.xml)

echo "Connecting to remote host and deleting files..."
lftp $ftpURL -u $userName,$userPWD -e "set ftp:ssl-allow no; cd \"$INPUT_WORKINGDIR\"; rm -r .; quit;"
