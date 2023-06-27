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
