################################
Scripts to generate the four plots are named "plot1.R", "plot2.R", "plot3.R", "plot4.R".
The plots themselves are found in "plot1.png", "plot2.png", "plot3.png", "plot4.png".

-----
Before running each script it is first necessary to execute the following commands:

setwd(".../<path to directory where ExData_Plotting1-master.zip is unzipped and 'plot1/2/3/4.R' are>")
library(dplyr)
library(lubridate)
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";")
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")

-----
Then plots 1-4 can be generated (in a file rather than on screen) via the following commands:

plot_Global_Active_Power_hist(data)
plot_Global_Active_Power_vs_day(data)
plot_Energy_sub_metering_vs_day(data)
four_plots(data)


-----
There is a problem with the third plot which I have tried for a long time to solve but have been unable to. 
It looks close to what it is supposed to look like, and I'm certain that I'm reading the correct rows of data,
but for some reason, when the plot is generated, these random spikes appear that are not present either in the 
data or in the example plot. Also for two of the three series plotted, their minimum level is offset to slightly
above zero when really they should all bottom out at zero. This I cannot account for either. And finally the 
points plotted need to have a scaling factor applied to them to make them look right.

The problem is described more fully here in the discussion forum question I posted but got no useful answer to:

https://www.coursera.org/learn/exploratory-data-analysis/discussions/weeks/1/threads/7S7LSGmgEeeL9AqeWyzK2g

I hope the grading guidelines (found here: https://www.coursera.org/learn/exploratory-data-analysis/peer/ylVFo/course-project-1)
are enough for marks to not be deduced because of these problems. I believe I've pretty much fulfilled the requirements,
aside from being able to tackle this weird bug.
