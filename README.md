Jul 2021 - May 2022
# Lightweight ECG CNN Classifier for Edge Computing on Miniature Sensor

Continuous cardiac monitoring with wearable sensors can help patients respond immediately to cardiac emergencies, especially with ML models that can autonomously diagnose ECG readings. However, most ML models require large computational resources, thus the ECG data needs to be sent from the wearable sensor to a phone or the cloud. Data transmission is power intensive, reducing the sensor's battery life.

This project aims to develop a lightweight ECG Classifier and deploy it on an FPGA (CMOD A7) that is small enough to be embedded on a wearable sensor, so that ECG diagnosis can be performed on the device itself. The device can then alert patients of an emergency. This greatly extends the device battery life. The model was trained to predict Atrial Flutter (AFl) from a single ECG tracing, and the results are as follows:
```
Sensitivity (True-Positive): 80.4%
Specificity (True-Negative): 73.3%
```
Refer to this README for a summary of the implementation, or view the notebooks for in-depth description. The folder "Model Building" contains the files pertaining to the development of the CNN model with tensorflow, while the folder "Model Deployment" pertains to the codes to deploy the model on an FPGA.





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

A model wad trained to predict Atrial Flutter (afl_model_fpga.ipynb) from a single ECG lead.

Running the jupyter notebook after generating the "full_dataset.csv" file will execute the steps required to train the model.
