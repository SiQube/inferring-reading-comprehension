#!/usr/bin/env bash -e
echo 'Encoding data' 
mkdir -p nn/sbsat_splits
for setting in s1_rm1_lf1 s1_rm1_lf0 s1_rm1_lf1_pos_cont s1_rm0_lf0 s0_rm1_lf0 s0_rm0_lf1
do    
    if !(python3 src/encode_data.py --$setting --SBSAT);
        then echo 'Failed to encode data' && exit 1
    fi

    echo 'Running experiments' 
    if !(python3 nn/model.py --GPU 0 --$setting --SBSAT --save_dir nn/results --weights_dir  nn/weights
    );
        then echo 'Failed to run experiments' && exit 1
    fi
done    
