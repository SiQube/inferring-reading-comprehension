#!/usr/bin/env bash -e
mkdir -p data/SB-SAT/processed/
echo 'Extracting reading measures' 
if !(python3 src/reading_measures.py --SBSAT);
    then echo 'Failed to extract reading measures' && exit 1
fi
