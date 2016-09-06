# guide for steps to follow to generate the data, should work in smash

for ch in /usr/local/src/RNNexp/structural_rnn/h3.6m/*/checkpoint.pik; do
    model=${ch%_*};
    mmodel=${model##*/};
    python generateMotionForecastPartial.py $mmodel $ch; done
done

rename 's/checkpoint.pik//' */*_N_* */*forecast_error
python CRFProblems/H3.6m/generateMotionData.py

rename 's/.csv/_conv.csv/' */*csv
# then call matlab script after adapting paths
