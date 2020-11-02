# AIRS Instrument Research 2016 (JPL)
Files from my research internship at NASA Jet Propulsion Laboratory in Summer 2016.

## Table of Contents
* [Summary](#summary)
* [Data](#data)
* [Work](#work)
* [Conclusion](#conclusion)

## Summary
As part of my full-time internship at JPL via the NASA DIRECT-STEM program, I did exploratory observations and visualizations of atmospheric data during sample El Niño and La Niña periods. I plotted monthly data from the Atmospheric InfraRed Sounder (AIRS) instrument, as well as differences and averages between that data. I also created several time series showing their change over time, as well as how their patterns correlated with the Multivariate ENSO Index (MEI), which measures the intensity of ENSO (El Niño Southern Oscillation) events. 

The MEI is based on the six variables mainly observed over the Pacific Ocean: sea-level pressure, zonal and meridional components of surface wind, sea surface temperature, surface air temperature, and total cloudiness fraction of the sky.  The combined analysis of all of these values results in an “index” number that measures the overall intensity of an ENSO event.  A higher MEI value indicates an El Niño occurrence, while a lower MEI value is a sign of a La Niña occurrence.  Observing the changes in cloud top temperature and pressure over time alongside the ebb and flow of the MEI gives us further insight into how cloud top temperature and pressure are affected by ENSO events.

## Data
For this project, I took my cloud top temperature and cloud top pressure data from AIRS X3STM monthly products. These products have a spatial resolution of 1° x 1° in latitude/longitude degrees, and consist of data from the AIRS instrument’s 15 daily orbits over Earth. I looked at and plotted both ascending (roughly around daytime) and descending (nighttime) data, using the variables *CloudTopTemp_TqJ_A*, *CloudTopTemp_TqJ_D*, *CloudTopPres_TqJ_A*, and *CloudTopPres_TqJ_D*. In the event that the difference between the two products wasn’t too large, I would also average them together to get a total average monthly result. This data was acquired in the form of hdf5 files downloaded from an onsite JPL virtual machine, and parsed and plotted via MATLAB commands and the specialized MATLAB Mapping Toolbox.


## Work 
I first looked at the differences in cloud variables during El Niño vs. La Niña periods. I plotted cloud top temperature and pressure, creating separate figures for ascending (daytime) and descending (nighttime) results.  For my El Niño period, I used winter 2015 (December 2015 to February 2016), and for my La Niña period, I used winter 2010 (Dec. 2010 – Feb. 2011). These general plots can be found in the `AIRS` folder.  I also examined data taken during a La Niña event (in winter 2010) and an El Niño event (in winter of 2015, counted as December 2015/January 2016/February 2016) and concluded that overall cloud top temperature and pressure were lower during the El Niño than the La Niña. In my study area, the largest differences were visible in the Pacific Ocean, where 2010’s temperature/pressure were significantly higher than 2015’s. In the Atlantic, specifically off the coasts of Brazil and northern Africa, temperature and pressure were both higher during El Niño than La Niña.  Here are some of examples of the plots I created to examine the climatology of those times:
![Graph 1](https://github.com/claudss/JPL2016/blob/main/AIRS/DIFFERENCES/dec/DIFF_PA_12_2010_2015.png) ![Graph 2](https://github.com/claudss/JPL2016/blob/main/AIRS/DIFFERENCES/dec/DIFF_TA_12_2010_2015.png)

I created time series of cloud top temperature and pressure over winters from 2002 to 2015 that showed that there is a definite increase in temperature and pressure in the tropics, particularly the Pacific Ocean, over the time period of 2002 to 2016- note the graph below, in which red denotes an increase in temperature over time and blue denotes a decrease.
![Graph 3](https://github.com/claudss/JPL2016/blob/main/airscomp/CTP_A_CORR_Test.png)

Lastly, I created some supplemental plots that show cloud top temperature and pressure's correlation to the progression of ENSO’s MEI values during the winter, from winter 2002 to winter 2015. One such plot is shown here:
![Graph 4](https://github.com/claudss/JPL2016/blob/main/airscomp/CTP_A_MEI_Test.png)

## Conclusion
This project served as one of my first ventures into data analysis, starting from a simpler, exploratory angle. During my time in NASA DIRECT-STEM, in the academic year this internship occurred, I was able to explore the intersection of geosciences and computer science (e.g. learning ArcGIS, possible uses of and approaches to climate data). However, the following year I had to commit to my final year undergraduate senior design project, and was unable to follow up on this work at length.
