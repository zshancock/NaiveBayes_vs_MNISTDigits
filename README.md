R Practice
==============
##### Author - Zac Hancock (zshancock@gmail.com)
 
#### *Naive Bayes in R vs. MNIST Digits*

Naive Bayes model implementation in RStudio. My attempt to increase processing time on my local machine was to set all the pixel values
to either (0,1) instead of a range 0 through 255. Accuracy did not suffer (compared to other Naive Bayes models I ran), and my local machine did process the data faster (trained quicker, etc). Anyone with experience in R or with the Digits data (kaggle - MNIST digits competition) should be able to follow my code with ease. 

My submission scored a 83.3% accuracy on the test.csv (all unknowns). This is pretty low for the history of MNIST digits, however, I did not deploy a CNN or deep learning model (which perform very well on this data), so 83.3% is reasonable from what I have gathered for a Naive Bayes model. 

>The digits data contains handwritten characters with each pixels "intensity" value, between 0-255. The goal of the competition
>is to create a model that can predict the "Label" (the number 0-9) using the pixel values as inputs. 
>https://www.kaggle.com/c/digit-recognizer

 
