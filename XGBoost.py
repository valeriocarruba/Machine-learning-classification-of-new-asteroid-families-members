# Import the necessary modules
import pandas as pd
import numpy as np
# Import xgboost
import xgboost as xgb


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
X_train=X_train.values
y_train=fam_data.iloc[:,4]
print(np.shape(X_train),np.shape(y_train))

# Instantiate the XGBClassifier: xg_cl
n_est=88
xg_cl = xgb.XGBClassifier(objective='binary:logistic', n_estimators=n_est,
                          Subample=0.1, colsample_bytree=1, max_depth=5,
                          eta=0.1, alpha=0.1, reg_lambda=0.5,seed=123)
# Fit the classifier to the training data
xg_cl.fit(X_train, y_train)

# Read the background data
back_data=pd.read_csv("back_test", delimiter=" ")
X_test=back_data.iloc[:,1:4]
X_test=X_test.values
print(np.shape(X_test))

# Predict the labels of the test set: y_pred
y_pred = xg_cl.predict(X_test)
np.savetxt('results.dat',y_pred, fmt="%f")

