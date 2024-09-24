#PBS -N jevs_global_ens_cmce_atmos_precip_stats
#PBS -j oe
#PBS -S /bin/bash
#PBS -q dev
#PBS -A VERF-DEV
#PBS -l walltime=00:30:00
#PBS -l place=vscatter,select=1:ncpus=2:mem=100GB
#PBS -l debug=true

set -x

export OMP_NUM_THREADS=1

export HOMEevs=/lfs/h2/emc/vpppg/noscrub/${USER}/EVS_beta5
source $HOMEevs/versions/run.ver

export envir=prod
export NET=evs
export RUN=atmos
export STEP=stats
export COMPONENT=global_ens
export VERIF_CASE=precip
export MODELNAME=cmce

module reset
module load prod_envir/${prod_envir_ver}

source $HOMEevs/dev/modulefiles/$COMPONENT/${COMPONENT}_${STEP}.sh

evs_ver_2d=$(echo $evs_ver | cut -d'.' -f1-2)

export KEEPDATA=YES

export vhr=00
export COMIN=/lfs/h2/emc/vpppg/noscrub/$USER/${NET}_beta5/$evs_ver_2d
export COMOUT=/lfs/h2/emc/vpppg/noscrub/${USER}/${NET}_beta5/$evs_ver_2d
export DATAROOT=/lfs/h2/emc/stmp/${USER}/evs_beta5_test/$envir/tmp
export job=${PBS_JOBNAME:-jevs_${MODELNAME}_${VERIF_CASE}_${STEP}}
export jobid=$job.${PBS_JOBID:-$$}
#export SENDMAIL=NO
export run_mpi=no
export MAILTO='alicia.bentley@noaa.gov,lichuan.chen@noaa.gov'

${HOMEevs}/jobs/JEVS_GLOBAL_ENS_STATS
