corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        	files <- list.files( path = directory )

  	    	corvalues <- c() 
  
  		for(f in 1:length(files)){
    			data <- read.csv( paste(directory, "/", files[f], sep="") )
    			data <- data[complete.cases(data),]
    			if ( nrow(data) > threshold ) {
      			corvalues <- c(corvalues, cor(data$sulfate, data$nitrate) ) 
    			}
  		}  
  		return( corvalues )
}
