echo "switched to jdcohen2's NCSU bash settings"

#login credentials (store password separately)
export NCSU_PASSWORD=$(cat ~/.ncsu-pass)
export NCSU_USER="jdcohen2"


#shell into remote host
ssh-to-ncsu() {
	echo "logging into remote NCSU linux"
	sshpass -p $NCSU_PASSWORD ssh -X -Y ${NCSU_USER}@remote.eos.ncsu.edu
}

#access AFS file system
ncsu-ftp() {
	echo "logging into AFS sftp"
	sshpass -p $NCSU_PASSWORD  sftp ${NCSU_USER}@ftp.ncsu.edu
}

#test C programs and compare with diff
testWithSuffix() {
	export PROGRAM_NAME=$1
	export FILE_SUFFIX=$2

	echo "Running for $FILE_SUFFIX"

	gcc -D_GNU_SOURCE -Wall -std=c99 ${PROGRAM_NAME}.c -o ${PROGRAM_NAME} -lm
	./${PROGRAM_NAME} < input-${FILE_SUFFIX}.txt > test-output-${FILE_SUFFIX}.txt
	diff expected-${FILE_SUFFIX}.txt test-output-${FILE_SUFFIX}.txt

	echo "DONE"
}