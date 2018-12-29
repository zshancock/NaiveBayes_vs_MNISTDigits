*Naive Bayes in R vs. MNIST Digits*
==============
##### Author - Zac Hancock (zshancock@gmail.com)
 
A Naive Bayes model using R/RStudio. My attempt to increase processing time on my local machine was to set all the pixel values
to either (0,1) instead of a range 0 through 255. Accuracy did not suffer (compared to other Naive Bayes models I ran), and my local machine did process the data faster (trained quicker, etc). Anyone with experience in R or with the Digits data (kaggle - MNIST digits competition) should be able to follow my code with ease. 

My submission scored a 83.3% accuracy on the test.csv (all unknowns). This is pretty low for the history of MNIST digits, however, I did not deploy a CNN or deep learning model (which perform very well on this data), so 83.3% is reasonable from what I have gathered for a Naive Bayes model. 

>Quick background ~
>The digits data contains handwritten characters with each pixels "intensity" value, between 0-255. The goal of the competition
>is to create a model that can predict the "Label" (the number 0-9) using the pixel values as inputs. This project does not contain the 
>training and testing .csv files, but they can be found at the competition location on Kaggle.
>https://www.kaggle.com/c/digit-recognizer

 
 #### *Why is my Naive Bayes different?*
 The model itself is pretty straight-forward, however the preprocessing step wherein I change all pixel values 127-255 to 1 (black), 
 and 0-127 to 0 (white) really increased performance on my local machine. The below figure illustrates the preprocessing step, and 
 frankly the method seems to show minimal data loss in *most* cases. 
 
![alt text](https://github.com/zshancock/NaiveBayes_vs_MNISTDigits/blob/master/graphic/preprocessing.png)
