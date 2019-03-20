#instll library
install.packages('fasttext')
#import library
library('fastrtext')


##  data prepare
# read data from the wrangling 
train = read.csv('C:/Users/edwin/Documents/train_remStop_Tok_Lem_remTop4.csv',header = FALSE)
test = read.csv('C:/Users/edwin/Documents/test_Lem_Tok_removestop.csv',header=FALSE)

# randomise the rows for training
train = train[sample(nrow(train),length(train$V1)),]

# function to transform prepare data into the library require format
data_prepare <- function(train_dataframe){
  trainset_labels <- paste0("__label__", train_dataframe$V1)
  trainsetg_text = tolower(train_dataframe$V3)
  train_to_write <- paste(trainset_labels, trainsetg_text)
  train_tmp_file_txt <- tempfile()
  writeLines(text = train_to_write, con = train_tmp_file_txt)
  return(train_tmp_file_txt)
}

# use the function to transform the training data
train_data_ready = data_prepare(train)



# specify the model output directory for the model
# please specify the diretory of the model 
model <- 'C:/Users/edwin/Desktop\\model'


# use prepared data to train the model
# please contact the team member if need further information of the parameters
execute(commands = c("supervised", "-input", train_data_ready, "-output", model, "-dim", 100, 
                     "-lr", 1,'-lrUpdateRate',50, "-epoch", 50, "-wordNgrams", 4, "-verbose", 10, 
                     '-loss','ns','-minCount',1,'-ws',6))


# load model 
# same directory with model <- 'C:/Users/edwin/Desktop\\model' add .bin as extension
model <- load_model('C:/Users/edwin/Desktop/model.bin')

# get word vector from the model
word_vector <- get_word_vectors(model)
# get words in the model
word <- get_dictionary(model)

# predcit testset
predictions <- predict(model, sentences = test$V2, unlock_empty_predictions = TRUE)

# get the prediction labels 
test_labels <- sapply(predictions, names)

# combine the prediction and test data
output = data.frame(test$V1, test_labels)
output = paste(test$V1,test_labels)

# write into 'result.txt'
# please specify the output directory
writeLines(output,'C:/Users/edwin/Desktop/testing_labels_pred.txt')

