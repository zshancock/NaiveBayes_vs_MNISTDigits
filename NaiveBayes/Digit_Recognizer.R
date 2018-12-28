## Digit recognition ~ Goal: Predict "label" 0-9 on unknown dataset. 
## Training dataset had had 42,000 rows with 785 variables (includes label)
## The submission data set contained 28,000 rows with 784 (does not include label)

## Rows represented a single pixel in an image of a handwritten number, with a value of 0-255
## Value of 0 meant pixel was very dark, and 255 was very white. 

## Data was originally analyzed with all 0-255 analyzed as factors, but the model was very slow in processing,
## so the data was discretized into only "white" or "black" pixels, and increased performance times while
## maintaining accuracy. Here is the complete code used for the submission. 
## I prefer the inverse of dark/white for clarity (so I discretized into whiter pixels -> 1=black for example.)


# read in digits train data

digits <- read.csv("train.csv")
digits$label <- as.factor(digits$label) # target as factor

# make function for discretizing variables, 0 = white, 1= black
## I prefer the inverse of dark/white for clarity (so I discretized into whiter pixels -> 1=black for example.)

cut_func <- function(x){
  cut(x, breaks = c(-1,127,256), 
      labels =c("0","1"))
}

# finish pre-processing

digits[,2:785] <- sapply(digits[,2:785], cut_func)
digits[,2:785] <- lapply(digits[,2:785], factor)

# load appropriate libraries
try(library(e1071), silent = TRUE)

# using 80%/20%, split available data into train/test. 

random_list <- sample(1:dim(digits)[1])

digits.a <- digits[random_list[1:33600],]
digits.b <- digits[random_list[33601:42000],]

# build a Naive Bayes - e1071 model

digits.nb <- naiveBayes(label~., data = digits.a, laplace = 1)

pred.nb <- predict(digits.nb, newdata=digits.b, type=c("class"))

pred.nb.table <- data.frame(digits.b$label, pred.nb)
pred.nb.table$correct <- ifelse(pred.nb.table$nb.digits.b.label == pred.nb.table$pred.nb,1,0)

nb.accuracy <- round(sum(pred.nb.table$correct == 1)/8400*100,2) # 83.4% accuracy on
                                                                 # 20% left out data. 
                                                               
                                                               
                                                               


# Load unknown data with same pre-processing procedures

digits.test <- read.csv("test.csv")

digits.test[,1:784] <- sapply(digits.test[,1:784], cut_func)
digits.test[,1:784] <- lapply(digits.test[,1:784], factor)

# Apply to the unknown data for submission.

pred.test.nb <- predict(digits.nb, newdata = digits.test)

# Prepare for export in desired format for submission.

ImageID <- 1:nrow(digits.test)
nb.sub <- data.frame(ImageID, pred.test.nb)
colnames(nb.sub) <- c("ImageID", "Label")
write.csv(nb.sub, file = "nb_submission_discrete.csv", row.names = FALSE)


# Submission scored 83.3% 
