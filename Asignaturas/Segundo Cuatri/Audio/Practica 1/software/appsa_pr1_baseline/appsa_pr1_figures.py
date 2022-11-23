# MUCD - APPSA PR1

import appsa_pr1 as dcase
from matplotlib import pyplot as plt

# [!] Make sure to set the correct paths:
# 'DATASET_PATH' in appsa_pr1.py
# 'workspace' in config.py

# ---- Load Audio Files ----
filename = 'Y_AfYlb7oEsg_330.000_340.000' # Speach + Agua
filename2 = 'Y_ZZpAj4rIRk_80.000_90.000' # Pitido del inframundo + Ruido/Speach
filename3 = 'Y_gQFB_Utuf0_30.000_40.000' # Gato

# ---- First Audio File -----
# Waveform representation
plt.figure()
x, fs = dcase.plot_waveform(filename + '.wav')

# Mel-spectrogram representation
plt.figure()
mel = dcase.plot_melgram(filename + '.npy')

# Ground truth labels and predictions
    # Labels
plt.figure()
lab = dcase.plot_labels(filename + '.wav')
    # Predictions
plt.figure()
pre = dcase.plot_predictions(filename + '.wav', 'validation2019_predictions.tsv')
    # Label-Predictions
plt.figure()
lab_pre = dcase.plot_labels_predictions(filename + '.wav', 'validation2019_predictions.tsv')

# ---- Second Audio File -----
# Waveform representation
plt.figure()
x2, fs2 = dcase.plot_waveform(filename2 + '.wav')

# Mel-spectrogram representation
plt.figure()
mel2 = dcase.plot_melgram(filename2 + '.npy')

# Ground truth labels and predictions
    # Labels
plt.figure()
lab2 = dcase.plot_labels(filename2 + '.wav')
    # Predictions
plt.figure()
pre2 = dcase.plot_predictions(filename2 + '.wav', 'validation2019_predictions.tsv')
    # Label-Predictions
plt.figure()
lab_pre2 = dcase.plot_labels_predictions(filename2 + '.wav', 'validation2019_predictions.tsv')


# ---- Third Audio File -----
# Waveform representation
plt.figure()
x3, fs3 = dcase.plot_waveform(filename3 + '.wav')

# Mel-spectrogram representation
plt.figure()
mel3 = dcase.plot_melgram(filename3 + '.npy')

# Ground truth labels and predictions
    # Labels
plt.figure()
lab3 = dcase.plot_labels(filename3 + '.wav')
    # Predictions
plt.figure()
pre3 = dcase.plot_predictions(filename3 + '.wav', 'validation2019_predictions.tsv')
    # Label-Predictions
plt.figure()
lab_pre3 = dcase.plot_labels_predictions(filename3 + '.wav', 'validation2019_predictions.tsv')
