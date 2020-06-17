#!/bin/bash
#SBATCH -t 04:00:00
#SBATCH --mem=16GB
#SBATCH -N 1
#SBATCH -c 2
#SBATCH -J TCB-xnat2bids
#SBATCH --output ../logs/%J.txt

#--------- Variables ---------

# version of xnat2bids being used
version=v0.1.5 

# Your working directory in Oscar, usually /gpfs/data/<your PI's group>. 
# We pass (bind) this path to singularity so that it can access/see it                                    
data_dir=/gpfs/data/bnc  

# The first directory is where your dicoms and bids data will be exported to. 
# The second directory is the bidsmap file for your study
# Both should be inside the data_dir, otherwise it won't be seen by singularity                     
bids_root_dir=${data_dir}/shared/bids-export/${USER}

mkdir -m 775 ${bids_root_dir}

bidsmap_file=${data_dir}/shared/xnat-tools-examples/${USER}/bidsmaps/sanes_sadlum.json

# based on XNAT Accesion Number for the MR-Session (you must have access in XNAT)
session="XNAT_E00002"	

# our output session will be named sess-sesion_suffix
session_suffix="01" 

# Path to Singularity Image for xnat-tools (maintained by bnc)
simg=/gpfs/data/bnc/simgs/brownbnc/xnat-tools-${version}.sif

#--------- Run xnat2bids ---------

# runs singularity command to extract DICOMs from xnat and export to BIDS
singularity exec -B ${data_dir}                                         \
    ${simg} xnat2bids        			                                \
    --user ${XNAT_USER} --password "${XNAT_PASSWORD}"                   \
    --session ${session} --session_suffix ${session_suffix}             \
    --bids_root_dir ${bids_root_dir}                                    \
    --bidsmap_file ${bidsmap_file}                                  	\