
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
nc <- ncdf4::nc_open('C:/Users/brian/Downloads/VIIRS/VJ109H1.A2023169.h21v09.002.2023179013937.nc4')
print(paste("The file has",nc$nvar, "variables", nc$ndims, "dimensions", "and", nc$natts, "NetCDF attributes"))


# Describe contents of nc file
attributes(nc$var)$names
# for dif we want:
# 3, 11, 9

# Retrieve data array from file 
A <- ncvar_get(nc, attributes(nc$var)$names[4]) # SurfRefkect_I3, 16 bit unsigned
B <- ncvar_get(nc, attributes(nc$var)$names[6])# SurfReflect_QC_500m, 16 bit signed


# Also hdf5 file

# Open netcdf file using ncdf4 package
h5 <- ncdf4::nc_open('C:/Users/brian/Downloads/VIIRS/VJ109H1.A2023169.h21v09.002.2023179013937.h5')
print(paste("The file has",h5$nvar, "variables", h5$ndims, "dimensions", "and", h5$natts, "hdf5 attributes"))

# Describe contents of nc file
attributes(h5$var)$names


# Retrieve data array from file
A_h5 <- ncvar_get(h5, attributes(h5$var)$names[4])# SurfRefkect_I3, 16 bit unsigned
B_h5 <- ncvar_get(h5, attributes(h5$var)$names[5])# SurfReflect_QC_500m, 16 bit signed


## Compare values in the two Arrays
## Can check if arrays are the same in two ways: 1) identical and 2) ==

# using identical in base R
identical(A, A_h5)
identical(B, B_h5)


nc_close(nc)
nc_close(h5)


