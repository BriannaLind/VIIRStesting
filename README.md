# Access Granule-associated URL links from Earthdata Search
opendap (netcdf4) and earthdata search(hdf5) files

# Step 1:
Navigate to https://search.earthdata.nasa.gov/search. Type the product short name into the bar on the top left of the screen. For example VIIRS vegetation indices products have the short name VNP09A1. 

![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/08054384-eef8-47ca-a2b9-29a678a26514)

# Step 2:
Choose a version. Products often have more than one version to choose from; this indicates there have been revisions and/or updates have been added to the product since it's initial release.  

![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/ca4f302a-c635-4bde-9bf8-5dc9899a0a08)

# Step 3: 
Filter product granules by adding a Granule ID. This is particulalry useful if you know what tiles [LINKTO] you are intested in. Use astericks for efficiency. At this time you may also want to add temporal parameters to your query.

![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/923ee4f5-2bd0-4e18-a44a-a286117cce7a)

# Step 4: 
Choose a granule and click on the set of 3 vertically-aligned grey circles the upper right corner of the granule box.  This action reveals two choices: 1) 'View details', and 2) 'Filter granule'. Click 'View details'.

![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/d573a5c7-61ce-458e-955a-647564f4d1d9)

# Step 5: 
Examine the 'Information' tab.  It contains links to many resources associated with this specific granule (VNP09A1.A2023169.h18v03.002.2023179035600). 

![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/467c4873-3ad7-45c2-ac2a-b5026a533487)

# Step 6:
Press 'control, f' to reveal a webpage search bar.  
- To download the granule frome earthdata search: type 'h5' in the search bar and press enter.
  Copy the https url that starts with 'data.lpdaac.earthcloud.nasa.gov...' and ends with '.h5', paste it into a new browser and press enter; it will begin downloading. 

  ![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/e048f7b3-2ff4-431b-ba00-a619c1cfe790)

- To download the granule from opendap: type 'opendap' in the search bar and press enter.

  ![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/986c94e3-f5c3-4727-9f65-006bce1ad1f5)

  Copy the https url that starts with 'opendap.earthdata.nasa.gov...' and paste it into a new browser and press enter. 

  ![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/bfedd7ee-86d2-4f7a-8b86-a4db934d6ddd)

  Choose "NetCDF-4" y=under Actions, Download encoding: in the upper left of the page. The data URL will update to have a 'dap.nc4' on the end. 

  ![image](https://github.com/BriannaLind/VIIRStesting/assets/104585874/5e85bc96-2a15-402b-b456-75212d7228f8)

  Press the 'Get Data' button and choose the location you would like you save the file. 
