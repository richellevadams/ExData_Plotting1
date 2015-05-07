
df_in<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
df_new<-na.omit(df_in)
a<-c("2007-02-01", "2007-02-02")
a<-as.Date(a)
df<-df_new[as.Date(as.character(df_new$Date), format="%d/%m/%Y") %in% a,]
df$Date<-paste(df$Date, df$Time, sep=" ")
df$Time<-NULL
df$Date<-strptime(as.character(df$Date), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png")
plot(df$Date, df$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()