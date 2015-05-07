#Read in the textfile into data frame, all "?" replaced with NA, 
#use the header line that comes in with the data
#The data in the textfile are separated by  ";"

df_in<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Remove all records with "NA"
df_new<-na.omit(df_in)

#Identify the character string in the "Date" field of the data that corresponds to the dates required.
#Convert to Date type for comparison purposes
#Filter records according to the required dates.

a<-c("2007-02-01", "2007-02-02")
a<-as.Date(a)
df<-df_new[as.Date(as.character(df_new$Date), format="%d/%m/%Y") %in% a,]

#Concatenate the character variables "Date" and "Time" and copy into the original "Date" variable
#Then remove the original "Time" column/variable.
#Convert the new "Date" variable to date-time format

df$Date<-paste(df$Date, df$Time, sep=" ")
df$Time<-NULL
df$Date<-strptime(as.character(df$Date), format="%d/%m/%Y %H:%M:%S")

png(file="plot1.png")
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()