#!/bin/bash

OUTPUTDIR=${HOME}/bidstest
mkdir ${OUTPUTDIR} || echo "${OUTPUTDIR} already exists"

BIDSMAP=../bidsmaps/sanes_sadlum.json

XNAT_USER="testuser"
XNAT_SESSION="XNAT3_E00001"

xnat2bids ${XNAT_SESSION} ${OUTPUTDIR} -u ${XNAT_USER} -f ${BIDSMAP} -i 1 -i 6