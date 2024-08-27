library(readxl)
library(tidyverse)

library(gganimate)
library(readr)
library(readxl)
library(gridExtra)
# install.packages("rvest")
library(rvest)
library(readr)
library(sf)
library(sp)
library(magick)
library(jpeg)
library(lubridate)
library(urbnmapr)
library(cr)
# install.packages(cr)
library(gifski)
library(ggtext)
library(ggplot2)
library(camcorder)

library(rvest)

# Set the URL
url <- "https://origami-database.com/models/"

# Initialize an empty data frame to store the origami data
origami_data <- data.frame(
  Image = character(),
  Name = character(),
  Description = character(),
  Difficulty = character(),
  Time = character(),
  stringsAsFactors = FALSE
)

# Read the HTML content
page <- read_html(url)

# Extract the origami items
items <- page %>% html_nodes(".model-card")

# Extract information for each origami item
for (item in items) {
  # Extract the image
  image <- item %>% html_node(".model-card__image img") %>% html_attr("src")
  
  # Extract other details
  name <- item %>% html_node(".model-card__header") %>% html_text(trim = TRUE)
  description <- item %>% html_node(".model-card__summary") %>% html_text(trim = TRUE)
  # Extract other details
  # Extract difficulty from the span with class icon--star
  difficulty <- item %>% html_node(".icon--star") %>% html_text(trim = TRUE)
  time <- item %>% html_node(".icon--clock") %>% html_text(trim = TRUE)
  
  # Append the data to the data frame
  origami_data <- rbind(origami_data, data.frame(
    Image = image,
    Name = name,
    Description = description,
    Difficulty = difficulty,
    Time = time,
    stringsAsFactors = FALSE
  ))
}

# Display the origami data
print(origami_data)
View(origami_data)

origami_data

time
name
print(name)
# Save the origami data to a CSV file
write.csv(origami_data, file = "origami_data_models.csv", row.names = FALSE)


# Success message
cat("Data has been successfully scraped and saved to origami_data_models.csv.\n")

