#!/bin/bash

#SBATCH --partition=epyc_long       # the requested queue
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=4G
#SBATCH --error=logs/%J.err
#SBATCH --output=logs/%J.out
#SBATCH --mail-user=wilsoncl6@cardiff.ac.uk
#SBATCH --mail-type=BEGIN,END,FAIL

#################################################################################
# Print Slurm Parameters to Console
#################################################################################

echo "Usable Environment Variables:"
echo "============================="
echo "hostname=$(hostname)"
echo \$SLURM_JOB_ID=${SLURM_JOB_ID}
echo \$SLURM_NTASKS=${SLURM_NTASKS}
echo \$SLURM_NTASKS_PER_NODE=${SLURM_NTASKS_PER_NODE}
echo \$SLURM_CPUS_PER_TASK=${SLURM_CPUS_PER_TASK}
echo \$SLURM_JOB_CPUS_PER_NODE=${SLURM_JOB_CPUS_PER_NODE}
echo \$SLURM_MEM_PER_CPU=${SLURM_MEM_PER_CPU}

export workingdir=/mnt/scratch45/c21010903/


#for line in  $workingdir/BLASTX_RiMJ_Viridiplantae/blastx_RiMJ_Viridi_OrthoCodes; do 
#	grep ${line} $workingdir/odb12v2_genes.tab >> $workingdir/extracted_codes_genes.tab
#done 

while read line 
do 
	grep ${line} $workingdir/odbv2_genes_RiABViridi.tab >> $workingdir/extracted_RiABViridi_codes_genes.tab

done < $workingdir/BLASTX_RiAB_Viridiplantae/blastx_RiAB_Viridi_OrthoCodes

