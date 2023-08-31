#!/usr/bin/env bash -e
echo 'Reformating lexical surprisal for SB-SAT dataset' 
if !(python3 src/reformat_lexical_surprisal_SBSAT.py);
    then echo 'Failed to reformat lexical surprisal for SB SAT dataset' && exit 1
fi

if !(echo 'Reformating texts for SB-SAT dataset' && python3 src/reformat_SBSAT_texts.py --reformat); 
then echo 'Text reformatting failed' && exit 1
fi    
