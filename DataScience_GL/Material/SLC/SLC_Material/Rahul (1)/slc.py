import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

from sklearn.datasets import load_breast_cancer
dataset = load_breast_cancer()

X = dataset.data
y = dataset.target

# For simplicity sake, not splitting data into train and test
# working of KNN

# Model based
from sklearn.linear_model import LogisticRegression
log_reg = LogisticRegression()
%time log_reg.fit(X, y) # 2.27 s

%time log_reg.score(X, y) # 485 ms

# Instance based
from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors = 7)
%time knn.fit(X, y) # 205 ms

%time knn.score(X, y) # 407 ms

# The time taken for prediction is almost equal for both the algos
# this happens because our training dataset is very small.
# For a large or moderately large dataset this difference will
# become much high in the favour of Logistic Regression.

# Best value of 'K' using Grid Search

param = {'n_neighbors' : [3, 4, 5, 6, 7]}

from sklearn.model_selection import GridSearchCV
grid = GridSearchCV(KNeighborsClassifier(), param)
grid.fit(X, y)

grid.best_score_
grid.best_estimator_
grid.best_params_

pd.DataFrame(X).isnull().sum()

# KNN Imputation

sample = [[10, 20, np.nan], [25, 35, 42], [10, 2, 3]]

from sklearn.impute import KNNImputer
knimp = KNNImputer()
sample = knimp.fit_transform(sample)













































