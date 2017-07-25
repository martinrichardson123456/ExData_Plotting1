# library(dplyr)
#
# data <- read.table("./exdata_data_household_power_consumption/
#                     household_power_consumption.txt", sep = ";")

plot_Global_Active_Power_hist <- function(dataset){
  
  first_cell <- as.character(dataset[1,1])

  dataset_subset <- dataset[2:nrow(dataset), ]

  date_1 <- as.Date(as.character("2007-02-01"))
  date_2 <- as.Date(as.character("2007-02-02"))

  dataset_subset$V1 <- as.character(dataset_subset$V1)
  dataset_subset$V1 <- as.Date(dataset_subset$V1, format = "%d/%m/%Y")
  
  dataset_subset <- filter(dataset_subset, dataset_subset$V1 >= date_1 
                           & dataset_subset$V1 <= date_2)
  
  View(dataset_subset)
  
  png(file = "plot1.png", width = 480, height = 480)
  
  hist(as.numeric(dataset_subset$V3) / 450, 
  #hist(as.numeric(dataset_subset$V3), 
       col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)", 
       breaks = 24, 
       xlim = c(0,8))

  #plot(as.numeric(dataset_subset$V3), 
  #     col = "red", main = "Global Active Power", 
  #     xlab = "Global Active Power (kilowatts)", 
  #     breaks = 24, 
  #     xlim = c(0,8))
  
  dev.off()
  
} # plot_Global_Active_Power_hist