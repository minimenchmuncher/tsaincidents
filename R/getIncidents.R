#library(pdftools)
#library(readr)

pdfDataToTbl <- function(x) {
  strings <- strsplit(pdftools::pdf_text(x), "\n")
  headers <- unlist(strsplit(strings[[1]][1], " +"))
  stringsClean <- lapply(strings, function(r) r[2:length(r)])  #remove top row
  lastpg <- stringsClean[[length(stringsClean)]]
  stringsClean[[length(stringsClean)]] <- lastpg[1:(length(lastpg) - 3)]
  dat <- do.call(rbind, lapply(seq_along(stringsClean), function(pg) {
    #TODO: This fails when a "page" is only one line.
    readr::read_fwf(stringsClean[[pg]],
                    col_positions = readr::fwf_empty(stringsClean[[pg]], col_names = c("date", "airport", "caliber", "make", "loaded", "chambered")),
                    col_types = readr::cols(
                      date = readr::col_date(format = "%m/%d/%Y"),
                      airport = readr::col_character(),
                      caliber = readr::col_character(),
                      make = readr::col_character(),
                      loaded = readr::col_factor(),
                      chambered = readr::col_factor()
                    ))
  }))
  #dat$date <- as.Date(dat$date, format = "%m/%d/%Y")
  #dat$loaded <- as.factor(dat$loaded)
  #dat$chambered <- as.factor(dat$chambered)
  return(dat)
}
