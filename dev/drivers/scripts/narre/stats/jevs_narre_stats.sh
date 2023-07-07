#!/bin/bash 

#PBS -N jevs_narre_stats
#PBS -j oe
##PBS -o /lfs/h2/emc/ptmp/binbin.zhou/evs/tmpnwprd/evs_narre_stat.o
##PBS -e /lfs/h2/emc/ptmp/binbin.zhou/evs/tmpnwprd/evs_narre_stat.e
#PBS -S /bin/bash
#PBS -q dev
#PBS -A EVS-DEV
#PBS -l walltime=00:30:00
#PBS -l place=vscatter,select=1:ncpus=16:mem=500GB
#PBS -l debug=true
#PBS -V

set -x

export OMP_NUM_THREADS=1

export evs_ver=v1.0
export HOMEevs=/lfs/h2/emc/vpppg/noscrub/${USER}/EVS

source $HOMEevs/versions/run.ver.metplus5.0.0

module reset
echo Loading modules........

module load envvar/$envvar_ver
module load PrgEnv-intel/$PrgEnv_intel_ver
module load intel/$intel_ver
module load cray-pals/$craypals_ver
module load libjpeg/$libjpeg_ver
module load grib_util/$grib_util_ver
module load prod_util/$prod_util_ver
module load prod_envir/$prod_envir_ver
module load wgrib2/$wgrib2_ver
module load libpng/$libpng_ver
module load zlib/$zlib_ver
module load jasper/$jasper_ver
module load netcdf/$netcdf_ver
module load cfp/$cfp_ver

export HPC_OPT=/apps/ops/prod/libs
module use /apps/ops/prod/libs/modulefiles/compiler/intel/$intel_ver
module load gsl/${gsl_ver}
module load python/$python_ver
module load met/$met_ver
module load metplus/$metplus_ver
module load udunits/${udunits_ver}

module list

export envir=prod

export NET=evs
export STEP=stats
export COMPONENT=narre
export RUN=atmos
export VERIF_CASE=grid2obs
export MODELNAME=narre

export KEEPDATA=YES

export cyc=00

export rum_mpi=yes

export FIXevs=/lfs/h2/emc/vpppg/noscrub/emc.vpppg/verification/EVS_fix
export COMOUT=/lfs/h2/emc/vpppg/noscrub/${USER}/$NET/$evs_ver
export DATA=/lfs/h2/emc/ptmp/${USER}/evs/tmpnwprd

export maillist='geoffrey.manikin@noaa.gov,binbin.zhou@noaa.gov'

export job=${PBS_JOBNAME:-jevs_${MODELNAME}_${VERIF_CASE}_${STEP}}
export jobid=$job.${PBS_JOBID:-$$}

if [ -z "$maillist" ]; then

   echo "maillist variable is not defined. Exiting without continuing."

else

  ${HOMEevs}/jobs/narre/stats/JEVS_NARRE_STATS

fi
