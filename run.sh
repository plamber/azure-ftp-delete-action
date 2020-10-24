#!/bin/sh -l

echo "Processing..."
echo "${{ inputs.profile }}"
echo "${{ inputs.profile }}" > input.xml
echo input.xml
ftpURL=$(xmllint --xpath 'string((//publishData/publishProfile[@publishMethod = "FTP"])[1]/@publishUrl)' input.xml)
userName=$(xmllint --xpath 'string((//publishData/publishProfile[@publishMethod = "FTP"])[1]/@userName)' input.xml)
userPWD=$(xmllint --xpath 'string((//publishData/publishProfile[@publishMethod = "FTP"])[1]/@userPWD)' input.xml)

echo "Connecting to remote host and deleting files..."
lftp $ftpURL -u $userName,$userPWD -e "set ftp:ssl-allow no; cd \"${{ inputs.workingDir }}\"; rm -r .; quit;"
