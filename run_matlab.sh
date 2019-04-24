#!/bin/bash

# for SIGMA in `seq 12`; do for THRES in `seq 0 0.01 0.1`; do for NUMK in 100 200 400 500 750 1000 1250 1500 2000 300; do for RUNTYPE in `seq 12`; do qsub -v SIGMA=$SIGMA,THRESH=$THRES,NUMK=$NUMK,RUNTYPE=$RUNTYPE ./run_matlab.sh ; if ((`qstat | wc -l` >430)); then echo "sleeping ..." `qstat | wc -l`; sleep 30; fi; done; done; done; done

matlab -nojvm -nodisplay -nodesktop -r "run $HOME/research/SSC/scripts/main_grid_search.m"
