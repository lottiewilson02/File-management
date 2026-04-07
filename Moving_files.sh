#!/bin/bash
#SBATCH --partition=defq       # the requested queue
#SBATCH --nodes=1              # number of nodes to use
#SBATCH --tasks-per-node=1     # for parallel distributed jobs
#SBATCH --cpus-per-task=4      # for multi-threaded jobs
#SBATCH --mem-per-cpu=4G      # in megabytes, unless unit explicitly stated
#SBATCH --error=logs/%J.err         # redirect stderr to this file
#SBATCH --output=logs/%J.out        # redirect stdout to this file
#SBATCH --mail-user=wilsoncl6@cardiff.ac.uk     # email
#SBATCH --mail-type=BEGIN,END,FAIL      # email on job start, end, and/or failure


echo "Usable Environment Variables:"
echo "============================="
echo "hostname=$(hostname)"
echo \$SLURM_JOB_ID=${SLURM_JOB_ID}
echo \$SLURM_NTASKS=${SLURM_NTASKS}
echo \$SLURM_NTASKS_PER_NODE=${SLURM_NTASKS_PER_NODE}
echo \$SLURM_CPUS_PER_TASK=${SLURM_CPUS_PER_TASK}
echo \$SLURM_JOB_CPUS_PER_NODE=${SLURM_JOB_CPUS_PER_NODE}
echo \$SLURM_MEM_PER_CPU=${SLURM_MEM_PER_CPU}

#set up working directories
export datadir=/mnt/data/GROUP-sbitl2/c21010903/genome_map/
export scratchdir=/mnt/scratch45/c21010903/

#star
mkdir $datadir/featureCounts
cp -r $scratchdir/featureCounts/*_FeatCount $datadir/featureCounts
