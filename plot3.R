# library(dplyr)
# library(lubridate)
# data <- read.table("./exdata_data_household_power_consumption/
#                     household_power_consumption.txt", sep = ";")

plot_Energy_sub_metering_vs_day <- function(dataset){
  
  dataset_subset <- dataset[2:nrow(dataset), ]

  date_1 <- as.Date(as.character("2007-02-01"))
  date_2 <- as.Date(as.character("2007-02-02"))

  dataset_subset$V1 <- as.character(dataset_subset$V1)
  #dataset_subset$V1 <- as.Date(dataset_subset$V1, format = "%Y/%m/%d")
  dataset_subset$V1 <- as.Date(dataset_subset$V1, format = "%d/%m/%Y")

  
  dataset_subset <- filter(dataset_subset, dataset_subset$V1 >= date_1 
                           & dataset_subset$V1 <= date_2)

  View(dataset_subset)

  combined_date_time <- paste(dataset_subset$V1, dataset_subset$V2)
  #combined_date_time <- as_datetime(combined_date_time)
  combined_date_time <- strptime(combined_date_time, format = "%Y-%m-%d %H:%M:%S")
  combined_date_time <- as_datetime(combined_date_time)
  
  #png(file = "plot3.png", width = 480, height = 480)
#0.9, 5.0, 0.7 (conversion factors to replace 1)
  plot(x = combined_date_time, y = as.numeric(dataset_subset$V7), type = "l", 
       main = "", xlab = "", ylab = "Energy sub metering", col = "black", 
       ylim = c(0, 40))

  lines(x = combined_date_time, y = as.numeric(dataset_subset$V8) / 1, type = "l", main = "", xlab = "", 
        ylab = "Energy sub metering", col = "red")
  
  lines(x = combined_date_time, y = as.numeric(dataset_subset$V9) / 1, type = "l", main = "", xlab = "", 
        ylab = "Energy sub metering", col = "blue")
  
  #par(new = TRUE)
  #plot(x = combined_date_time, y = as.numeric(dataset_subset$V8) / 1, type = "l", main = "", xlab = "", 
  #      ylab = "Energy sub metering", col = "red",  ylim = c(0, 40))
  #par(new = TRUE)
  #plot(x = combined_date_time, y = as.numeric(dataset_subset$V9) / 1, type = "l", main = "", xlab = "", 
  #      ylab = "Energy sub metering", col = "blue",  ylim = c(0, 40))
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), lty = c(1,1,1))
  
  #for(i in 1:length(dataset_subset$V9)){
  for(i in 1:10){
    #if(as.numeric(dataset_subset$V9[i]) / 1 > 20){
    #if(1){
      print(paste("dataset_subset$V9[i] =", dataset_subset$V9[i], 
                  "combined_date_time[i] =", combined_date_time))
     #   } 
  }
    
  #dev.off()
  
} # plot_Global_Active_Power_vs_day()