# Set up project -----

# install.packages("targets")
library(targets)

# load functions
source("R/functions.R")

# specify required packages for targets themselves
# i.e., packages needed to execute functions
tar_option_set(packages = c("here", "tidyverse"))

# "targets" pipeline
# includes essential functions and arguments
list(
  tar_target(file, here::here("data.csv"), format = "file"),
  tar_target(data, get_data(file)),
  tar_target(model, fit_model(data)),
  tar_target(plot, plot_model(model, data))
)