get_data <- function(file) {
  read.csv(file) %>%
    tidyr::drop_na() %>%
    dplyr::filter(cuisine_type %in%
                   c("American", "Japanese", "Italian", "Chinese"))
}

# food <- get_data(here::here("./data/food_order.csv"))

fit_model <- function(data) {
  lm(food_preparation_time ~ cost_of_the_order + cuisine_type, data)
  # %>%
  #   coefficients()
}

# fit_model(food) %>%
#   car::Anova()

plot_model <- function(model, data) {
  ggplot(data) +
    geom_point(aes(x = cost_of_the_order,
                   y = food_preparation_time,
                   color = cuisine_type)) +
    geom_smooth(aes(x = cost_of_the_order,
                    y = food_preparation_time,
                    fill = cuisine_type,
                    color = cuisine_type),
                method = "lm",
                se = TRUE) +
    theme_minimal()
}

# plot_model(fit_model(food), food)
