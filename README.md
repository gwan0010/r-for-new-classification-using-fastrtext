--------------------
Env requirements
--------------------
R version >= 3.5

packages:
fastrtext

--------------------
Directory Path
--------------------
root
- data (directory)
  under data directory
  - training_docs.txt
  - training_labels_final.txt
  - testing_docs.txt
  - stopwords_en.txt 
  - train_remStop_Tok_Lem_remTop4.csv (generated file)
  - test_Lem_Tok_removestop.csv (generated file)
  - testing_labels_pred.txt (* generated file/predict results)


----------------------
Data Files and Preparation
----------------------
- put all the original data files under ‘C:/data/’directory


----------------------
Codes running Operations
----------------------
assume already in the root directory (same level as this file)
using following order
Run fit5149Test_data_wrangling.ipynb
Run FIT5149Training_data_wrangling.ipynb
Run train_model.R

after running above codes, the final predict results will be stored in testing_labels_pred.txt under data directory

--------------------
Algorithmic Analysis
--------------------

- Use Continuous bag of word (CBOW) and N-gram to produce the word vector space
- It sums all the vector in one article to produce an article space and use CBOW to predict labels. 
- In the process of training text pre-processing, it lemmatises, tokenise and remove the most frequent 4 words.  
- In the process of testing text pre-processing, it lemmatises, tokenise




