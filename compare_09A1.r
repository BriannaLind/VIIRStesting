
# Difference Testing VIIRS 09A1 

## Packages used in this script
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

# Load libraries
library(raster)
library(ncdf4)

# Begin by downloading tile 
# use nc_open to establish the file path, and file name
# Open netcdf file using ncdf4 package
nc <- ncdf4::nc_open('C:/Users/brian/Downloads/VIIRS/completepairs/VNP09GA.A2023200.h10v03.002.2023201111029.nc4')
print(paste("The file has",nc$nvar, "variables", nc$ndims, "dimensions", "and", nc$natts, "NetCDF attributes"))


# Describe contents of nc file
attributes(nc$var)$names

# to check differences need to check full range if bit types we want
# Retrieve data array from file 1km data
A <- ncvar_get(nc, attributes(nc$var)$names[3]) # land_water_mask_c, 8 bit unsigned
B <- ncvar_get(nc, attributes(nc$var)$names[25])# obscov_1km_c, 8 bit signed
C <- ncvar_get(nc, attributes(nc$var)$names[8]) # solar zenith_c, 16 bit signed
D <- ncvar_get(nc, attributes(nc$var)$names[27])# nadd_obs_row_1km, 32 bit signed
E <- ncvar_get(nc, attributes(nc$var)$names[11])# nadd_obs_row_500km, 32 bit signed
G <- ncvar_get(nc, attributes(nc$var)$names[12])# obscov_500m_c, 8 bit signed
H <- ncvar_get(nc, attributes(nc$var)$names[41])# SurfRelfect_M4_1
I <- ncvar_get(nc, attributes(nc$var)$names[59])# I3

# Complete steps for hdf5 file
# Open netcdf file using ncdf4 package
h5 <- ncdf4::nc_open('C:/Users/brian/Downloads/VIIRS/completepairs/VNP09GA.A2023200.h10v03.002.2023201111029.h5')
print(paste("The file has",h5$nvar, "variables", h5$ndims, "dimensions", "and", h5$natts, "hdf5 attributes"))

# Describe contents of nc file
attributes(h5$var)$names


# Retrieve data array from file
A_h5 <- ncvar_get(h5, attributes(h5$var)$names[25])# land water mask_c, 8 bit unsigned
B_h5 <- ncvar_get(h5, attributes(h5$var)$names[28])# obscov_1km_c, 8 bit signed
C_h5 <- ncvar_get(h5, attributes(h5$var)$names[4]) # solar zenith_c, 16 bit signed
D_h5 <- ncvar_get(h5, attributes(h5$var)$names[26])# nadd_obs_row_1km, 32 bit signed
E_h5 <- ncvar_get(h5, attributes(h5$var)$names[27])# nadd_obs_row_500km, 32 bit signed
G_h5 <- ncvar_get(h5, attributes(h5$var)$names[29])# obscov_500m_c, 8 bit signed
H_h5 <- ncvar_get(h5, attributes(h5$var)$names[41])# nadd_obs_row_500km, 32 bit signed
I_h5 <- ncvar_get(h5, attributes(h5$var)$names[59])# obscov_500m_c, 8 bit signed

## Compare values in the two Arrays
## Can check if arrays are the same in two ways: 1) identical and 2) ==

# using identical in base R
identical(A, A_h5)
identical(B, B_h5)
identical(C, C_h5)
identical(D, D_h5)
identical(E, E_h5)
identical(G, G_h5)
identical(H, H_h5)
identical(I, I_h5)

nc_close(nc)
nc_close(h5)

# Investigate difs
# using "==" in base R. If LC_Type1 equals LC_Type1_hd, put 0, else put 1.  If there are no differences between the arrays, the sum of should be 0; if the sum is greater than 0, there are some differences.
diffs <- ifelse(A==A_h5, 0, 1)
sum   <- sum(diffs)
sum

