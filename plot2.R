# library(dplyr)
# library(lubridate)
# data <- read.table("./exdata_data_household_power_consumption/
#                     household_power_consumption.txt", sep = ";")

plot_Global_Active_Power_vs_day <- function(dataset){
  
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

  png(file = "plot2.png", width = 480, height = 480)
  
  plot(x = combined_date_time, y = as.numeric(dataset_subset$V3) / 500, type = "l", main = "", xlab = "", 
       ylab = "Global Active Power (kilowatts)")

  dev.off()
  
} # plot_Global_Active_Power_vs_day()