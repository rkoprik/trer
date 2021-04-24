library(dplyr)
library(ggplot2)
library(ExPanDaR)

load("data/generated/sample.rda")

fig_scatter <- ggplot(
  smp, aes(x = ln_gdp_capita, y = life_expectancy, color = region)
) +
  geom_point(alpha = 0.3) +
  labs(
    color = "World Bank Region",
    x = "Ln(Income per capita in thsd. 2010 US-$)",
    y = "Life expectancy in years"
  ) +
  theme_minimal()

tab_desc_stat <- prepare_descriptive_table(
  smp %>% select(-year, -ln_gdp_capita)
)

tab_corr <- prepare_correlation_table(
  smp %>% select(-year, -gdp_capita),
  format = "latex", booktabs = TRUE, linesep = ""
)

tab_regression <-  prepare_regression_table(
  smp,
  dvs = rep("life_expectancy", 4),
  idvs = list(
    c("ln_gdp_capita"),
    c("ln_gdp_capita", "unemployment"),
    c("ln_gdp_capita", "unemployment"),
    c("ln_gdp_capita", "unemployment")
  ),
  feffects = list("", "", "year", c("country", "year")),
  cluster = list("", "",  "year", c("country", "year")),
  format = "latex"
)

# My contribution

# Table - life expect by income level
  tab_expand <- aggregate(smp$life_expectancy, 
              by=list(Income=smp$income_level), 
              FUN=mean)
  tab_expand <- tab_expand %>% 
    # desc orders from largest to smallest
    arrange(desc(x))
  names(tab_expand)[names(tab_expand) == "x"] <- "Life Expectancy"
  names(tab_expand)[names(tab_expand) == "Income"] <- "World Bank Income Group"
  
# By income level Average - evolution of life_expectancy
  # Avg per income level
  tab_group_avg <- aggregate(smp$life_expectancy, 
                          by=list(Year=smp$year, Income=smp$income_level), 
                          FUN=mean)
  # plot
  fig_scatter_level <- ggplot(data = tab_group_avg, aes(x=Year, y=x)) + 
    geom_line(aes(colour=Income)) +
    labs(
      color = "World Bank Income Level", 
      x = "Year",
      y = "Life expectancy in years"
    ) +
    theme_minimal()

# General Average - evolution of life_expectancy
  # average calc
  tab_gen_avg <- aggregate(life_expectancy ~ year, data=smp, mean)
  # evolution of life_expectancy
  fig_scatter_avg <- ggplot(
    tab_gen_avg, aes(x = year, y = life_expectancy)
  ) +
    geom_line() +
    labs(
      color = "World Bank Region",
      x = "Year",
      y = "Life expectancy in years"
    ) +
    theme_minimal()
  

save(
  list = c(ls(pattern = "fig_*"), ls(pattern = "tab_*")),
  file = "output/results.rda"
)
