# -*- coding: utf-8 -*-
"""
@author: Dominic Boccaleri and partner
"""


from pandas import Series, DataFrame
import pandas as pd
import numpy as np
import nltk
import re
from nltk.stem import WordNetLemmatizer
from sklearn.svm import LinearSVC
from sklearn.metrics import classification_report
import sklearn.metrics
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import GridSearchCV
from sklearn.linear_model import LogisticRegression
import json
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier
from sklearn.neural_network import MLPClassifier


# A combination of Word lemmatization + LinearSVC model finally pushes the accuracy score past 80%

traindf = pd.read_json("C:/Users/domin/Desktop/Grad/Data_Quality_and_Text_Mining/Lyrics/Goodfiles/train_80.formatted.json")
traindf['lyrics_clean_string'] = [' , '.join(z).strip() for z in traindf['lyrics']]  
traindf['lyrics_string'] = [' '.join([WordNetLemmatizer().lemmatize(re.sub('[^A-Za-z]', ' ', line)) for line in lists]).strip() for lists in traindf['lyrics']]       

testdf = pd.read_json("C:/Users/domin/Desktop/Grad/Data_Quality_and_Text_Mining/Lyrics/Goodfiles/data_prof.json") 
testdf['lyrics_clean_string'] = [' , '.join(z).strip() for z in testdf['lyrics']]
testdf['lyrics_string'] = [' '.join([WordNetLemmatizer().lemmatize(re.sub('[^A-Za-z]', ' ', line)) for line in lists]).strip() for lists in testdf['lyrics']]       



corpustr = traindf['lyrics_string']
vectorizertr = TfidfVectorizer(stop_words='english',
                             ngram_range = ( 1 , 1 ),analyzer="word", 
                             max_df = .62 , binary=False , token_pattern=r'\w+' , sublinear_tf=False)
tfidftr=vectorizertr.fit_transform(corpustr)
corpusts = testdf['lyrics_string']
vectorizerts = TfidfVectorizer(stop_words='english')
tfidfts=vectorizertr.transform(corpusts)

predictors_tr = tfidftr

targets_tr = traindf['genre']

predictors_ts = tfidfts


#classifier = LinearSVC(C=0.80, penalty="l2", dual=False)
parameters = {'C':[1, 10]}
#clf = LinearSVC()
clf = LogisticRegression()
#parameters = {'n_neighbors':[1,10]}
#clf = KNeighborsClassifier()
#parameters = {'min_samples_split': [2,10]}
#clf = DecisionTreeClassifier()
#clf = RandomForestClassifier()
### Nerual Network took too long

classifier = GridSearchCV(clf, parameters)

classifier=classifier.fit(predictors_tr,targets_tr)

predictions=classifier.predict(predictors_ts)
testdf['genre'] = predictions
# testdf = testdf.sort_values('id' , ascending=True)

testdf[['id' , 'lyrics_clean_string' , 'genre' ]].to_csv("submission.csv")