
# Difference Testing

## Packages for for this script
packages = c('raster', 'ncdf4')

# Identify missing packages
new.packages = packages[!(packages %in% installed.packages()[,"Package"])]

# Loop through and download the required packages
if (length(new.packages)[1]==0){
  message('All packages already installed')
}else{
  for (i in 1:length(new.packages)){
    message(paste0('Installing: ', new.packages))
    install.packages(new.packages[i])
  }
}
  
# Load required libraries
library(raster)
library(ncdf4)


### Begin testing pair 
#VNP09A1 V002
# Open netcdf file using ncdf4 package
nc <- ncdf4::nc_open('C:/Users/brian/Downloads/VIIRS/VNP09A1.A2023169.h21v09.002.2023179032045.nc4')
print(paste("The file has",nc$nvar, "variables", nc$ndims, "dimensions", "and", nc$natts, "NetCDF attributes"))


# Describe contents of nc file
attributes(nc$var)$names
# for dif we want:
# 3, 11, 9

# Retrieve data array from file
DOY <- ncvar_get(nc, attributes(nc$var)$names[3])
RM1 <- ncvar_get(nc, attributes(nc$var)$names[11])
RQC <- ncvar_get(nc, attributes(nc$var)$names[9])


# Also hdf5 file

# Open netcdf file using ncdf4 package
h5 <- ncdf4::nc_open('C:/Users/brian/Downloads/VIIRS/VNP09A1.A2023169.h21v09.002.2023179032045.h5')
print(paste("The file has",h5$nvar, "variables", h5$ndims, "dimensions", "and", h5$natts, "hdf5 attributes"))

# Describe contents of nc file
attributes(h5$var)$names


# Retrieve data array from file
DOY_h5 <- ncvar_get(h5, attributes(h5$var)$names[5])
RM1_h5 <- ncvar_get(h5, attributes(h5$var)$names[6])
RQC_h5 <- ncvar_get(h5, attributes(h5$var)$names[15])


## Compare values in the two Arrays
## Can check if arrays are the same in two ways: 1) identical and 2) ==
  
# using identical in base R
identical(DOY_h5, DOY)
identical(RM1_h5, RM1)
identical(RQC_h5, RQC)


nc_close(nc)
nc_close(h5)


