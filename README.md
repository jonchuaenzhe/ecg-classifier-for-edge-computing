# ecg_diagnosis

## Data

The data is obtained from https://physionetchallenges.org/2021/

To run the jupyter notebooks, save the databases in the following folder names:
1. CPSC Database: data/cpsc
2. CPSC-Extra Database: data/cpsc2
3. PTB-XL Database: data/ptbxl
4. The Georgia 12-lead ECG Challenge (G12EC) Database: data/georgia
5. Chapman-Shaoxing Database: data/chapman
6. Ningbo Database: data/ningbo

## Data Processing

The jupyter notebook data_exploration.ipynb cosnsists of the steps to generate a dataframe that consists of the filenames of each ECG recording and the relevant labels attached to it. It produces the csv "full_dataset.csv".

## Model Training and Prediction

A model wad trained to predict Atrial Flutter (fpga_afl_model.ipynb) from a single ECG lead.

Running the jupyter notebook after generating the "full_dataset.csv" file will execute the steps required to train the model.