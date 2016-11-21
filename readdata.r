readData<-function(){
    require("data.table")
    library(data.table)
    dt <- fread("curl https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip | funzip")
    dt$Date<-as.Date(strptime(dt$Date, format="%d/%m/%Y"))    
    dt<-dt[Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02")]
    dt$dateTime<-paste(dt$Date,sep=" ", dt$Time);
    dt$dateTime<-as.POSIXct(dt$dateTime, "%d/%m/%Y %H:%M:%S")
    dt$Global_active_power<-as.numeric(gsub("?",NA,dt$Global_active_power, fixed = TRUE))
    dt$Global_reactive_power<-as.numeric(gsub("?",NA,dt$Global_reactive_power, fixed = TRUE))
    dt$Voltage<-as.numeric(gsub("?",NA,dt$Voltage, fixed = TRUE))
    dt$Global_intensity<-as.numeric(gsub("?",NA,dt$Global_intensity, fixed = TRUE))
    dt$Sub_metering_1<-as.numeric(gsub("?",NA,dt$Sub_metering_1, fixed = TRUE))
    dt$Sub_metering_2<-as.numeric(gsub("?",NA,dt$Sub_metering_2, fixed = TRUE))
    dt$Sub_metering_3<-as.numeric(gsub("?",NA,dt$Sub_metering_3, fixed = TRUE))
    dt
}
