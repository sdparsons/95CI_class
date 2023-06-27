## Bootstrapping exercise

# fetch data
trees <- datasets::trees

# tree BMI
tree_BMI <- trees$Volume / sqrt(trees$Height)

# create a random sample
sample(tree_BMI)

# create a random sample, with replacement
sample(tree_BMI, replace = TRUE)



# create an empty dataset
sample_BMIs <- NULL

for(i in 1:20) {
  
  sample_temp <- mean(sample(tree_BMI, replace = TRUE))
  
  sample_BMIs <- c(sample_BMIs, sample_temp)
}

sample_BMIs

mean(sample_BMIs)

# extract 95% confidence interval using the 2.5 and 97.5 percentiles
quantile(sample_BMIs, c(.025, .975))


# visualise the bootstrapped distribution

library("ggplot2")
library("dplyr")
as.data.frame(sample_BMIs) %>%
  ggplot(aes(x = sample_BMIs)) +
  geom_histogram() +
  labs(x = "sample BMI", y = "Frequency") +
  geom_vline(xintercept = mean(sample_BMIs)) + # mean
  geom_vline(xintercept = quantile(sample_BMIs, .025)) + # lower CI
  geom_vline(xintercept = quantile(sample_BMIs, .975)) + # upper CI
  geom_label(aes(x = mean(sample_BMIs), y = 30, label = "Mean")) +
  geom_label(aes(x = quantile(sample_BMIs, .025), y = 30, label = "lower 95% CI")) +
  geom_label(aes(x = quantile(sample_BMIs, .975), y = 30, label = "upper 95% CI"))