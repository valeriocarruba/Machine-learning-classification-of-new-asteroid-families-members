# Import the necessary modules
import pandas as pd
import numpy as np
# Import bagged decision trees for classification
from sklearn.ensemble import AdaBoostClassifier
from sklearn.tree import DecisionTreeClassifier 

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

# Read the background data
back_data=pd.read_csv("back_test", delimiter=" ")
X_test=back_data.iloc[:,1:4]
print(np.shape(X_test))

# Instantiate dt_entropy, set 'entropy' as the information criterion
dt_entropy = DecisionTreeClassifier(max_depth=3, criterion='entropy', random_state=1)

# Using Adaptive Boosting of 100 iterations
num_trees=41
clf_DT_Boost=AdaBoostClassifier(base_estimator=dt_entropy,n_estimators=num_trees, learning_rate=0.1,random_state=2017)

clf_DT_Boost.fit(X_train,y_train)
y_pred = clf_DT_Boost.predict(X_test)

np.savetxt('results.dat',y_pred, fmt="%f")

