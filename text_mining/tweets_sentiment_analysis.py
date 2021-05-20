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


# A combination of Word lemmatization + LinearSVC model finally pushes the accuracy score past 80%

traindf = pd.read_json("C:/Users/Dominic/Desktop/Goodfiles/Training1.json")
traindf['tweet_clean_string'] = [' , '.join(z).strip() for z in traindf['tweet']]  
traindf['tweet_string'] = [' '.join([WordNetLemmatizer().lemmatize(re.sub('[^A-Za-z]', ' ', line)) for line in lists]).strip() for lists in traindf['tweet']]       

testdf = pd.read_json("C:/Users/Dominic/Desktop/Goodfiles/test2_public1a.json") 
testdf['tweet_clean_string'] = [' , '.join(z).strip() for z in testdf['tweet']]
testdf['tweet_string'] = [' '.join([WordNetLemmatizer().lemmatize(re.sub('[^A-Za-z]', ' ', line)) for line in lists]).strip() for lists in testdf['tweet']]       



corpustr = traindf['tweet_string']
vectorizertr = TfidfVectorizer(stop_words='english',
                             ngram_range = ( 1 , 1 ),analyzer="word", 
                             max_df = .57 , binary=False , token_pattern=r'\w+' , sublinear_tf=False)
tfidftr=vectorizertr.fit_transform(corpustr)
corpusts = testdf['tweet_string']
vectorizerts = TfidfVectorizer(stop_words='english')
tfidfts=vectorizertr.transform(corpusts)

predictors_tr = tfidftr

targets_tr = traindf['sentiment']

predictors_ts = tfidfts


#classifier = LinearSVC(C=0.80, penalty="l2", dual=False)
parameters = {'C':[1, 10]}
#clf = LinearSVC()
clf = LogisticRegression()

classifier = GridSearchCV(clf, parameters)

classifier=classifier.fit(predictors_tr,targets_tr)

predictions=classifier.predict(predictors_ts)
testdf['sentiment'] = predictions
# testdf = testdf.sort_values('id' , ascending=True)

testdf[['id' , 'sentiment' ]].to_csv("boccaleri.submission2.csv")