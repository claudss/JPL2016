# AIRS Instrument Research 2016 (JPL)
Files from my research internship at NASA Jet Propulsion Laboratory in Summer 2016.

## Table of Contents


## Summary
As part of my full-time internship, I did exploratory observations and visualizations of atmospheric data during sample El Niño and La Niña periods. I plotted their monthly data, as well as differences and averages between them. I also created several time series showing their change over time, as well as how their patterns correlated with the Multivariate ENSO Index (MEI), which measures the intensity of ENSO (El Niño Southern Oscillation) events. 

## Data and Background Information
AIRS instrument monthly products were examined to get data on cloud top temperature and pressure. The satellite data came in the form of hdf5 files taken from the on-site JPL virtual machines, which were parsed via MATLAB. MATLAB's Mapping Toolbox was used to create visualizations of various statistics, since the data was already presented in terms of 1° x 1° grid squares, making it perfect to plot over a world map.
