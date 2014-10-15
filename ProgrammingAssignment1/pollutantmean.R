pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files( path = directory )[id]

  pollutant_mean<-c()

  for( nfile in 1:length(files) ) {
    data <- read.csv( paste(directory,"/", files[nfile], sep="") )
    pollutant_mean<-c(pollutant_mean, data[,pollutant])
  }
  return( round(mean(pollutant_mean, na.rm=TRUE),3) )
}