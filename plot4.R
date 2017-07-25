# library(dplyr)
# library(lubridate)
# data <- read.table("./exdata_data_household_power_consumption/
#                     household_power_consumption.txt", sep = ";")

four_plots <- function(dataset){
  
  first_cell <- as.character(dataset[1,1])

  dataset_subset <- dataset[2:nrow(dataset), ]

  date_1 <- as.Date(as.character("2007-02-01"))
  date_2 <- as.Date(as.character("2007-02-02"))

  dataset_subset$V1 <- as.character(dataset_subset$V1)
  dataset_subset$V1 <- as.Date(dataset_subset$V1, format = "%d/%m/%Y")
  
  dataset_subset <- filter(dataset_subset, dataset_subset$V1 >= date_1 
                           & dataset_subset$V1 <= date_2)

  View(dataset_subset)

  combined_date_time <- paste(dataset_subset$V1, dataset_subset$V2)
  combined_date_time <- as_datetime(combined_date_time)
  
  png(file = "plot4.png", width = 480, height = 480)
  
  par(mfrow = c(2,2))
  
  plot(x = combined_date_time, y = as.numeric(dataset_subset$V3) / 500, type = "l", main = "", xlab = "", 
       ylab = "Global Active Power", col = "black")
  
  plot(x = combined_date_time, y = as.numeric(dataset_subset$V5) / 1, type = "l", main = "", xlab = "", 
        ylab = "Voltage", col = "black")
  
  plot(x = combined_date_time, y = as.numeric(dataset_subset$V7) / 0.9, type = "l", main = "", xlab = "", 
        ylab = "Energy sub metering", col = "black", ylim = c(0, 40))
  lines(x = combined_date_time, y = as.numeric(dataset_subset$V8) / 5, type = "l", main = "", xlab = "", 
        ylab = "Energy sub metering", col = "red")
  lines(x = combined_date_time, y = as.numeric(dataset_subset$V9) / 0.7, type = "l", main = "", xlab = "", 
        ylab = "Energy sub metering", col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")

  plot(x = combined_date_time, y = as.numeric(dataset_subset$V4) / 1, type = "l", main = "", xlab = "", 
       ylab = "Global_Reactive_Power", col = "black")
  
  dev.off()
  
} # plot_Global_Active_Power_vs_day()