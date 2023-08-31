#!/usr/bin/env bash -e
mkdir -p data/SB-SAT/interim/fixation
echo 'Preprocessing fixation data' 
if !(python3 src/preprocess_fixations.py --SBSAT);
    then echo 'Failed to preprocess fixation data' && exit 1
fi
