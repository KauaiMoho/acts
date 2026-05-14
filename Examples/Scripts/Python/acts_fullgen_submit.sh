#!/bin/sh
#SBATCH --job-name=ACTS_SIGNAL #Job name
#SBATCH --mail-type=FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=kluitel@purdue.edu # Where to send mail	
#SBATCH --account=cms
#SBATCH --output=/depot/cms/kluitel/acts_output/test-%A.out	# Name output file 

NJOB=$1
NEVENTS=$2
TYPEGEN=$3

pwd; date; hostname


#   Run fewzz job  DY 1D in M   PI bkg
#   $1 == input parameter (working directory)

mydir=/home/kluitel/acts/Examples/Scripts/Python/
cd $mydir
source /cvmfs/sft.cern.ch/lcg/views/LCG_107/x86_64-el8-gcc11-opt/setup.sh
module load gcc/14.1.0
source ../../../build/python/setup.sh

echo "Working in "`pwd`

echo "Will run Tau3Mu Generation with ACTS for job = " ${NJOB}

if [ "$TYPEGEN" == "signal" ]; then

python full_chain_odd_tau3mu.py --ttbar --events ${NEVENTS} --rs ${NJOB} --ttbar-pu 0 --no-reco --output /depot/cms/kluitel/HEPT/data/tracking/raw/raw_signal

else

python full_chain_odd_minbias.py --ttbar --events ${NEVENTS} --ttbar-pu 0 --no-reco --output /depot/cms/kluitel/HEPT/data/tracking/raw/raw_bkg

fi

python cleanEmptyEvents.py ${TYPEGEN} ${NEVENTS}

date
