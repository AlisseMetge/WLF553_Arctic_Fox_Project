Arctic Fox Seasonal Molting Project
by Alisse Metge for WLF553 Reproducible Data Science

Data obtained from:
Laporte-Devylder, Lucie et al. (2022). Data from: A camera trap based assessment of climate-driven phenotypic plasticity of seasonal moulting in an endangered carnivore [Dataset]. Dryad. https://doi.org/10.5061/dryad.xd2547dhm

From the authors: "The dataset was built based on pictures extracted from motion-triggered camera traps installed on supplementary feeders nearby den sites and release sites, as part of the Norwegian Institute for Nature Reserach's (NINA) Arctic Fox Captive Breeding and Release Programme." "The data was collected for arctic foxes in Snøhetta, between the years 2011 and 2018. Seasonal values of temperature, snow parameters and rodent density index are also given. This dataset was used to investigate the morph-based differences in moulting timing and rate for arctic foxes, in response to environmental conditions."

Two data files were downloaded and modified as follows:

1- "morph_phenology.csv" contained 189 entries, with each row representing "a single arctic fox, with its corresping moulting dates for the different moulting stages observed."
I modified this file by removing all individual fox data and removing site duplicates, so that the file now contains only the rodent density index, temperature, and snow parameters for each site each year. This new file is called "site_data.csv" and contains 58 entries.

"site_data.csv" Columns explanation (as stated by original authors; unused columns removed by Alisse):
year = year of observation
rodent = rodent cycle phase reflecting abundance of locally occuring Lemmus, Myodes and Microtus species. Index values range from 1 to 4 (1 – low, 2 – increasing, 3 – peak, 4 – decreasing; see Angerbjörn et al., 2013 for details). 
temperature = average seasonal air temperature for the moulting season (April-July) for all sites, in °C.
snow_depth = Site-specific values of snow depth present on May 1st, in mm.
snow_continuous = Site-specific values of the number of days with continuous snow on the ground from January 1st.
site = location name of the camera within the study area.

2- "seasonal_moutling_phenology.csv" contained 883 entries of individual fox camera trap observations, where "each row represents a time point corresponding to a single moulting event. Whether the moult progression of an artic fox was observed from initiation to completion (95 to 0), or only in parts (e.g. 25 to 0) is specified by the ID of each arctic fox."
I modified this file by removing all site-specific tempearture, snow, and rodent data, so that the file now contains only the fox camera captures. The new file is called "moulting_data.csv" and contains the same 883 entries.

"moulting_data.csv" Columns explanation (as stated by original authors; unused columns removed by Alisse):
year = year of observation
site = location name of the camera within the study area.
morph = coat colour morph of the arctic fox (W = white, B = blue)
indiv_ID = unique identifier attributed to the observed arctic fox based on physical characteristics.
moult_score = progression stage of the recorded moulting event. Numbers correspond to categories of "% winter coat", and can take the value 95 (moult initiating), 75, 50, 25, or 0 (moult completed, full summer coat).
date = date of the observed transition to a given moulting stage, in Julian day (January 1st = 1, December 31st = 366 in 2012 and 2016, 365 all other years)

These two files, "site_data.csv" and "moulting_data.csv" were considered my raw data for this project.