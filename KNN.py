# Import the necessary modules
import pandas as pd
import numpy as np
# Import KNeighborsClassifier from sklearn.neighbors
from sklearn.neighbors import KNeighborsClassifier

"Some useful constants"
AU=1.49597870e11 
GAUSS= 0.01720209895
GM=GAUSS*GAUSS*365.25*365.25
FACTOR=AU/365.25/86400.
sqrfac=FACTOR**2
YEAR=365.25

# Read the family data
fam_data=pd.read_csv("family_test", delimiter=" ")
X_train=fam_data.iloc[:,1:4]
y_train=fam_data.iloc[:,4]
print(np.shape(X_train),np.shape(y_train))

# Create a k-NN classifier with 6 neighbors
knn = KNeighborsClassifier(n_neighbors=2)

# Fit the classifier to the data
knn.fit(X_train,y_train)

# Read the background data
back_data=pd.read_csv("back_test", delimiter=" ")
X_test=back_data.iloc[:,1:4]
print(np.shape(X_test))

# Predict the labels of the test set: y_pred
y_pred = knn.predict(X_test)

np.savetxt('results.dat',y_pred, fmt="%f")
