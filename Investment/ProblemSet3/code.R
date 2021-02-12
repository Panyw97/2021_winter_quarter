library(tidyverse)
data = read_csv('data.csv')

mean(data$`MSCI EAFE`-data$`Money Market`)
sqrt(var(data$`MSCI EAFE`))

cor(data[,1:4])

apply(data, 2, mean)

cov(data[,1:4])
