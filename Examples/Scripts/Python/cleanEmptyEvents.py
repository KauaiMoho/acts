import csv

from sys import argv
import os

typegen = argv[1]
nevents = int(argv[2])

folder =  '/depot/cms/kluitel/HEPT/data/tracking/raw/raw_' + typegen

for i in range(0,nevents):


    if not os.path.exists(folder + f'event00000{i:04d}-particles_simulated.csv'): continue

    with open(folder + f'event00000{i:04d}-particles_simulated.csv', mode='r', newline='') as file:
        reader = csv.reader(file)
        row_count = sum(1 for row in reader)
        if row_count == 1:
            os.remove(folder + f'event00000{i:04d}-cells.csv')
            os.remove(folder + f'event00000{i:04d}-hits.csv')
            os.remove(folder + f'event00000{i:04d}-hits.obj')
            os.remove(folder + f'event00000{i:04d}-hits_trajectory.obj')
            os.remove(folder + f'event00000{i:04d}-measurements.csv')
            os.remove(folder + f'event00000{i:04d}-measurement-simhit-map.csv')
            os.remove(folder + f'event00000{i:04d}-particles.csv')
            os.remove(folder + f'event00000{i:04d}-particles_simulated.csv')
            os.remove(folder + f'event00000{i:04d}-seed.csv')
            os.remove(folder + f'event00000{i:04d}-track_parameters_ambi.csv')
            os.remove(folder + f'event00000{i:04d}-track_parameters_ckf.csv')
            os.remove(folder + f'event00000{i:04d}-tracks_ambi.csv')
            os.remove(folder + f'event00000{i:04d}-tracks_ckf.csv')


