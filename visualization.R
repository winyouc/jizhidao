library(tidyverse)

covid_raw <- read.csv('SH_COVID_data.csv')

total <- c()

for (i in 1:nrow(covid_raw)){
  if (i == 1){
    total[i] = covid_raw$case_CT[i] + covid_raw$case_NOCT[i] - covid_raw$NOCT_CT[i]
  }else{
    total[i] = total[i - 1] + covid_raw$case_CT[i] + covid_raw$case_NOCT[i] - covid_raw$NOCT_CT[i]
  }
}

covid <- covid_raw %>%
  mutate(total = total,
         new_total = case_CT + case_NOCT - NOCT_CT,
         data_date = factor(data_date)
         )

single_day_new_plot <- covid %>% ggplot() +
  aes(x = data_date, y = new_total, group = 1) +
  geom_line(size = 0.5) +
  geom_point(size = 1.5) +
  labs(x = "Date", y = "Single Day Increase")

total_plot <- covid %>% ggplot() +
  aes(x = data_date, y = total, group = 1) +
  geom_line(size = 0.5) +
  geom_point(size = 1.5) +
  labs(x = "Date", y = "Total Cases")