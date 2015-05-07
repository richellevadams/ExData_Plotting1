
df_in<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
df_new<-na.omit(df_in)
a<-c("2007-02-01", "2007-02-02")
a<-as.Date(a)
df<-df_new[as.Date(as.character(df_new$Date), format="%d/%m/%Y") %in% a,]
df$Date<-paste(df$Date, df$Time, sep=" ")
df$Time<-NULL
df$Date<-strptime(as.character(df$Date), format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png")
plot(df$Date, df$Sub_metering_1, type="l", col="black", ylab="Energy  sub metering", xlab="")
lines(df$Date, df$Sub_metering_2, type="l", col="red")
lines(df$Date, df$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()