library(dplyr)


getAirportData <- function(fpath = 'Dat/NfdcFacilities.xls') {
    readr::read_tsv(fpath) %>%
    mutate(LocationID = sub("'","", LocationID),
           EffectiveDate = lubridate::mdy(EffectiveDate)) %>%
    select(State, County, City, FacilityName, ARPLatitude, ARPLongitude, ARPElevation, TrafficPatternAltitude, LandArea = LandAreaCoveredByAirport) %>%
    tidyr::separate(ARPLatitude,  c("lat_d", "lat_m", "lat_s"), sep = "-") %>%
    tidyr::separate(ARPLongitude, c("lon_d", "lon_m", "lon_s"), sep = "-") %>%
    mutate(lat_s = as.numeric(gsub("[A-z]", "", lat_s)),
           lon_s = as.numeric(gsub("[A-z]", "", lon_s)),
           lat_d = as.numeric(lat_d),
           lat_m = as.numeric(lat_m),
           lon_d = as.numeric(lon_m),
           lon_m = as.numeric(lon_m),
           latitude = lat_d + lat_m / 60 + lat_s / 3600,
           longitude = -1 * (lon_d + lon_m / 60 + lon_s / 3600))
}

