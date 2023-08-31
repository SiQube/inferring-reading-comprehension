#!/usr/bin/env bash -e
if !(git clone git@github.com:aeye-lab/etra-reading-comprehension data/etra-reading-comprehension);
    then
        echo 'Failed to clone aeye-lab/etra-reading-comprehension'
        exit 1
fi

echo 'Copying texts_sb_sat.txt to data/SB-SAT/interim/stimuli/' 
if !(cp data/etra-reading-comprehension/utils/texts_sb_sat.txt data/SB-SAT/interim/stimuli/);
    then
        echo 'Failed to copy texts_sb_sat.txt' 
        exit 1
fi

echo 'Copying surprisal.csv to data/SB-SAT/interim/stimuli/' 
if !(cp data/etra-reading-comprehension/utils/surprisal.csv data/SB-SAT/interim/stimuli/);
    then
        echo 'Failed to move surprisal.csv'
        exit 1
fi

echo 'Copying surprisal.csv to data/SB-SAT/interim/stimuli/' 
if !(cp data/etra-reading-comprehension/utils/surprisal.csv data/SB-SAT/interim/stimuli/);
    then
        echo 'Failed to copy surprisal.csv failed'
        exit 1
fi

if !(git clone git@github.com:ahnchive/SB-SAT data/SB-SAT/raw);
    then
        echo 'Failed to clone ahnchive/SB-SAT'
        exit 1
fi

echo 'Copying 18sat_fixfinal.csv to data/SB-SAT/raw/' 
if !(cp data/SB-SAT/raw/fixation/18sat_fixfinal.csv data/SB-SAT/raw/);
    then
        echo 'Failed to move 18sat_fixfinal.csv'
        exit 1
fi
