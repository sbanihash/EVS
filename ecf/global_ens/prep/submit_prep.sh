#!/bin/bash 


dir=/lfs/h2/emc/vpppg/noscrub/binbin.zhou/EVS/ecf/global_ens/prep
qsub $dir/jevs_global_ens_atmos_prep.ecf
qsub $dir/jevs_naefs_atmos_prep.ecf
sleep 4h
qsub $dir/jevs_global_ens_headline_prep.ecf
