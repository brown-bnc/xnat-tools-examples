#!/bin/bash

# this is where you dicoms and BIDS niftii will be saved under
OUTPUTDIR=${HOME}/bidstest
mkdir ${OUTPUTDIR} || echo "${OUTPUTDIR} already exists"

# spacify where you bidsmap file lives
BIDSMAP=../bidsmaps/sanes_sadlum.json

# replace with you XNAT user
XNAT_USER="testuser"

# replace with a XNAT assession number that you have permissions to
XNAT_SESSION="XNAT3_E00001"

# call xnat2bids, only include sequences 1 and 6
xnat2bids ${XNAT_SESSION} ${OUTPUTDIR} -u ${XNAT_USER} -f ${BIDSMAP} -i 1 -i 6