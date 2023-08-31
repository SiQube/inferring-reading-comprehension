#!/usr/bin/env bash -e

if !(echo 'Downloading en_core_web_trf, this might take a couple minutes...' && python3 -m spacy download en_core_web_trf); 
then 
    echo 'Failed to Download en_core_web_trf' |
        exit 1
fi    

if !(echo 'Downloading en_core_web_lg, this might take a couple minutes...' && python3 -m spacy download en_core_web_lg); 
then 
    echo 'Failed to Download en_core_web_lg' |
        exit 1
fi    


if !(echo 'Annotating SB SAT texts' && python3 src/annotate_texts.py --SBSAT);
then echo 'Failed to reformat SB SAT texts'
fi
