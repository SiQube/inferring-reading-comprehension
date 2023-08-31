#!/usr/bin/env bash -e
echo '~~~~~~~ Installing dependencies ~~~~~~~'
if !(pip install -r requirements.txt);
then
    echo 'Failed during installation requirements, precisely see error above'
    exit 1
fi
echo '===> Completed installing dependencies'

echo '~~~~~~~ Downloading data ~~~~~~~'
if !(source scripts/get_data.sh);
then
    echo 'Failed to get data'
    exit 1
fi
echo '===> Completed downloading data'

echo '~~~~~~~ Preprocessing SB-SAT data ~~~~~~~'
if !(source scripts/preprocess_sbsat_data.sh);
then 
    echo 'Failed during preprocessing SB SAT texts, precisely see error above'
    exit 1
fi
echo '===> Completed SB-SAT preprocessing'

echo '~~~~~~~ Annotating texts ~~~~~~~'
if !(source scripts/annotate_texts.sh);
then 
    echo 'Failed during text annotation, precisely see above'
    exit 1
fi
echo '===> Completed text annotation'

echo '~~~~~~~ Preprocessing fixation data ~~~~~~~'
if !(source scripts/preprocess_fixation_data.sh);
then 
    echo 'Failed during preprocessing the fixation data, precisely see error above'
    exit 1
fi
echo '===> Completed fixation data'

echo '~~~~~~~ Extracting reading measures ~~~~~~~'
if !(source scripts/extract_reading_measures.sh);
then 
    echo 'Failed during reading measure extraction, precisely see error above'
    exit 1
fi
echo '===> Completed reading measure extraction'

echo '~~~~~~~ Extracting target label ~~~~~~~'
if !(source scripts/extract_target_label.sh);
then 
    echo 'Failed during reading target label extraction, precisely see error above'
    exit 1
fi
echo '===> Completed target label extraction'

echo '~~~~~~~ Running experiments ~~~~~~~'
if !(source scripts/experiments.sh);
then 
    echo 'Failed trying to run the experiments, precisely see error above'
    exit 1
fi
echo '===> Completed experiments'
