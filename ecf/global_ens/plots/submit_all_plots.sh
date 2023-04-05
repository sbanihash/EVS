#!/bin/bash 

cd /lfs/h2/emc/vpppg/noscrub/binbin.zhou/EVS/ecf/global_ens/plots

qsub jevs_gefs_grid2grid_past31days_plots.ecf               
qsub jevs_gefs_grid2obs_past31days_plots.ecf
qsub jevs_gefs_grid2obs_past31days_init_separate_plots.ecf
qsub jevs_gefs_profile1_past31days_plots.ecf  
qsub jevs_gefs_profile2_past31days_plots.ecf  
qsub jevs_gefs_profile3_past31days_plots.ecf  
qsub jevs_gefs_profile4_past31days_plots.ecf  
qsub jevs_gefs_sea_ice_past31days_plots.ecf   
qsub jevs_gefs_precip_past31days_plots.ecf                  
qsub jevs_gefs_snowfall_past31days_plots.ecf 
qsub jevs_gefs_sst_past31days_plots.ecf

qsub jevs_naefs_grid2grid_past31days_plots.ecf
qsub jevs_naefs_grid2obs_past31days_plots.ecf
qsub jevs_naefs_precip_past31days_plots.ecf

qsub jevs_gefs_grid2grid_past90days_plots.ecf
qsub jevs_gefs_grid2obs_past90days_plots.ecf
qsub jevs_gefs_grid2obs_past90days_init_separate_plots.ecf
qsub jevs_gefs_profile1_past90days_plots.ecf
qsub jevs_gefs_profile2_past90days_plots.ecf
qsub jevs_gefs_profile3_past90days_plots.ecf
qsub jevs_gefs_profile4_past90days_plots.ecf
qsub jevs_gefs_sea_ice_past90days_plots.ecf
qsub jevs_gefs_precip_past90days_plots.ecf
qsub jevs_gefs_snowfall_past90days_plots.ecf
qsub jevs_gefs_sst_past90days_plots.ecf

qsub jevs_naefs_grid2grid_past90days_plots.ecf
qsub jevs_naefs_grid2obs_past90days_plots.ecf
qsub jevs_naefs_precip_past90days_plots.ecf

qsub jevs_gefs_precip_spatial_plots.ecf
