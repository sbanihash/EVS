#PBS -N jevs_cam_href_severe_prep
#PBS -j oe
#PBS -S /bin/bash
#PBS -q dev
#PBS -A VERF-DEV
#PBS -l walltime=0:30:00
#PBS -l place=shared,select=1:ncpus=1:mem=10GB
#PBS -l debug=true


set -x

cd $PBS_O_WORKDIR


############################################################
# Load modules
############################################################


export model=evs
export NET=evs
export STEP=prep
export COMPONENT=cam
export RUN=atmos

export HOMEevs=/lfs/h2/emc/vpppg/noscrub/$USER/EVS_beta5
source $HOMEevs/versions/run.ver
module reset
module load prod_envir/${prod_envir_ver}

source $HOMEevs/dev/modulefiles/$COMPONENT/${COMPONENT}_${STEP}.sh
evs_ver_2d=$(echo $evs_ver | cut -d'.' -f1-2)

export vhr=${vhr:-${vhr}}


############################################################
# For dev testing
############################################################
export envir=prod
export DATAROOT=/lfs/h2/emc/stmp/${USER}/evs_beta5_test/$envir/tmp
export KEEPDATA=NO
export VERIF_CASE=severe
export MODELNAME=href
export modsys=href
export job=${PBS_JOBNAME:-jevs_${COMPONENT}_${MODELNAME}_${VERIF_CASE}_${STEP}_${vhr}}
export jobid=$job.${PBS_JOBID:-$$}
export COMIN=/lfs/h2/emc/vpppg/noscrub/$USER/${NET}_beta5/$evs_ver_2d
export COMOUT=/lfs/h2/emc/vpppg/noscrub/$USER/${NET}_beta5/$evs_ver_2d/$STEP/$COMPONENT
############################################################

export SENDCOM=${SENDCOM:-YES}
export SENDECF=${SENDECF:-YES}
export SENDDBN=${SENDDBN:-NO}
export KEEPDATA=${KEEPDATA:-NO}

export MAILTO=${MAILTO:-'marcel.caron@noaa.gov,andrew.benjamin@noaa.gov'}

if [ -z "$MAILTO" ]; then

   echo "MAILTO variable is not defined. Exiting without continuing."

else

   # CALL executable job script here
   $HOMEevs/jobs/JEVS_CAM_PREP

fi


######################################################################
# Purpose: This job preprocesses HREF member data for use in
#          CAM severe verification job
######################################################################

