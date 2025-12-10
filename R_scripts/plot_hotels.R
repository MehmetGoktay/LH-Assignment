# Load required libraries
library(rworldmap)
library(rworldxtra)

# Input file
file_path = 'hotels_information.csv'

# Load data
table <- read.csv(file_path, header = TRUE)

# Load world map (high resolution)
data("countriesHigh")

# Define zoom region for Belgium + Netherlands
xlim <- c(2, 7.5)
ylim <- c(49, 54.5)

# Save output to a PNG file
png("hotel_map.png", width = 1200, height = 1200, res = 150)

# Plot region
plot(countriesHigh,
     xlim = xlim,
     ylim = ylim,
     asp = 1,
     col = "lightgray",
     main = "Hotel Locations in Belgium & Netherlands",
     axes = TRUE,          # <-- show axes
     xlab = "Longitude",   # <-- label X axis
     ylab = "Latitude")    # <-- label Y axis
# Add points
points(table$longitude,
       table$latitude,
       col = "red",
       pch = 20,
       cex = 0.7)

dev.off()

cat("Map saved as hotel_map.png\n")

