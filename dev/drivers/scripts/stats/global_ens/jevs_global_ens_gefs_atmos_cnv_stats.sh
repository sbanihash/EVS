#PBS -N jevs_global_ens_gefs_atmos_cnv_stats
#PBS -j oe
#PBS -S /bin/bash
#PBS -q dev
#PBS -A EVS-DEV
#PBS -l walltime=01:30:00
#PBS -l place=vscatter,select=1:ncpus=28:mem=100GB
#PBS -l debug=true


#Total 40  processes = 4x4 profile, 4x4 sfc, 2x4 cloud

set -x

export HOMEevs=/lfs/h2/emc/vpppg/noscrub/${USER}/EVS

source $HOMEevs/versions/run.ver

export envir=prod
export NET=evs
export RUN=atmos
export STEP=stats
export COMPONENT=global_ens
export VERIF_CASE=cnv
export MODELNAME=gefs


module reset
module load prod_envir/${prod_envir_ver}

source $HOMEevs/dev/modulefiles/$COMPONENT/${COMPONENT}_${STEP}.sh




export KEEPDATA=YES

export cyc=00
export COMIN=/lfs/h2/emc/vpppg/noscrub/${USER}/$NET/$evs_ver
export COMOUT=/lfs/h2/emc/vpppg/noscrub/${USER}/$NET/$evs_ver
export DATAROOT=/lfs/h2/emc/stmp/${USER}/evs_test/$envir/tmp
export job=${PBS_JOBNAME:-jevs_${MODELNAME}_${VERIF_CASE}_${STEP}}
export jobid=$job.${PBS_JOBID:-$$}
export SENDMAIL=YES
export maillist='alicia.bentley@noaa.gov,steven.simon@noaa.gov'

${HOMEevs}/jobs/JEVS_GLOBAL_ENS_STATS
