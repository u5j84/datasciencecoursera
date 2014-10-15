# Coursera: Exploratory data analysis. Project 1:1
#   Data specifics: ; = separator
#                   ? = NA

# read in data; do *not* read in strings as Factors (breaks things later)
data = read.table("household_power_consumption.txt", header=TRUE,
                  sep=";", na.strings="?", stringsAsFactors=FALSE)

# convert Date column format DD-MM-YYYY to YYYY-MM-DD
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset Data to use only 2007-02-01 and 2007-02-02 dates
data.set <- subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")

#initialise plot1.png as a png, 480x480
png("plot1.png", width=480, height=480)

  # plot histogram, set labels
  hist(data.set$Global_active_power,
    main="Global active power",
    xlab="Global active power (kilowatts)",
    col='red',
    ylim=c(0,1200)
  )

#close and write to file
dev.off()

