#!/bin/bash
#SBATCH -t 04:00:00
#SBATCH --mem=16GB
#SBATCH -N 1
#SBATCH -c 2
#SBATCH -J xnat2bids
#SBATCH --output ../logs/%J.txt

#--------- Variables ---------
# This line makes our bash script complaint if we have undefined variables
set -u

# version of xnat2bids being used
version=v1.0.0

# Your working directory in Oscar, usually /gpfs/data/<your PI's group>.
# We pass (bind) this path to singularity so that it can access/see it
data_dir=/gpfs/data/bnc

# Output directory
# It has to be under the data_dir, otherwise it won't be seen by singularity
bids_root_dir=${data_dir}/shared/bids-export/${USER}
mkdir -m 775 ${bids_root_dir} || echo "Output directory already exists"

# Path to Singularity Image for xnat-tools (maintained by bnc)
simg=/gpfs/data/bnc/simgs/brownbnc/xnat-tools-${version}.sif

# Read variables in the .env file in current directory
set -a
[ -f .env ] && . .env
set +a

# uncomment to print environment variables with XNAT in the name
# printenv | grep XNAT

#--------- Run xnat2bids ---------
# runs singularity command to extract DICOMs from xnat and export to BIDS
# this command tells singularity to launch out xnat-tools-${version}.sif image
# and execute the xnat2bids command with the given inputs.
# The `-B ${data_dir}` makes that directory available to the singularity container
# The file system inside your container is not the same as in Oscar, unless you bind the paths
# The -i passes a sequence to download, without any -i all sequences will be processed
singularity exec --contain -B ${data_dir} ${simg} \
    xnat2bids ${XNAT_SESSION} ${bids_root_dir} \
    -u ${XNAT_USER} \
    -p "${XNAT_PASSWORD}" \
    -i 1 -v -v 
