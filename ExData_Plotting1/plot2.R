# Coursera: Exploratory data analysis. Project 1:2
#   Data specifics: ; = separator
#                   ? = NA

# read in data; do *not* read in strings as Factors (breaks things later)
data = read.table("household_power_consumption.txt", header=TRUE,
                  sep=";", na.strings="?", stringsAsFactors=FALSE)

# convert date column from DD/MM/YYYY to YYYY-MM-DD
data$Date<-as.Date(data$Date,'%d/%m/%Y')

# subset Data to use only 2007-02-01 and 2007-02-02 dates
data.sub<-subset(data, data$Date>="2007-02-01" & data$Date<= "2007-02-02")

# create dateTime column, format: YYYY-MM-DD HH:MM:SS
data.sub$dateTime<-strptime(paste(data.sub$Date,data.sub$Time),format='%Y-%m-%d %H:%M:%S')

#initialise plot2.png as a png, 480x480
png(file='plot2.png', width=480, height=480)  
  # from data.sub plot x:dateTime, y:Global_active_power
  with(data.sub,
       plot(dateTime,Global_active_power, 
            type='l',
            ylab='Global Active Power (kilowatts)',
            xlab='')
       )
dev.off()
