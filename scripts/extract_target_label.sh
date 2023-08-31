#!/usr/bin/env bash -e
mkdir -p data/SB-SAT/interim/labels
echo 'Extracting target label' 
if !(python3 src/extract_label.py --SBSAT);
    then echo 'Failed to extract target label' && exit 1
fi
