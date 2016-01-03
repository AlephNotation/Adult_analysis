



train = read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data",
                   sep=",",header=F,col.names=c("age", "type_employer", "fnlwgt", "education", 
                                                "education_num","marital", "occupation", "relationship", "race","sex",
                                                "capital_gain", "capital_loss", "hr_per_week","country", "income"),
                   fill=FALSE, strip.white=T)
ex <-train

  #the fnlwgt weight is not necessary for our purposes. 
  train$fnlwgt <- NULL
  #education_num is already represented by the factor variable education
  train$education_num <- NULL
  
  
  train$type_employer = as.character(train$type_employer)
  train$occupation = as.character(train$occupation)
  train$country = as.character(train$country)
  train$education = as.character(train$education)
  train$race = as.character(train$race)
  train$marital = as.character(train$marital)
  
  table(train$type_employer)
  train$type_employer = gsub("^Federal-gov","Federal-Govt",train$type_employer)
  train$type_employer = gsub("^Local-gov","Other-Govt",train$type_employer)
  train$type_employer = gsub("^State-gov","Other-Govt",train$type_employer)
  train$type_employer = gsub("^Private","Private",train$type_employer)
  train$type_employer = gsub("^Self-emp-inc","Self-Employed",train$type_employer)
  train$type_employer = gsub("^Self-emp-not-inc","Self-Employed",train$type_employer)
  train$type_employer = gsub("^Without-pay","Not-Working",train$type_employer)
  train$type_employer = gsub("^Never-worked","Not-Working",train$type_employer)
  
  table(train$type_employer)
  
  
  train$age <- scale(train$age)
  table(train$occupation)
  
  train$occupation = gsub("^Adm-clerical","Admin",train$occupation)
  train$occupation = gsub("^Armed-Forces","Military",train$occupation)
  train$occupation = gsub("^Craft-repair","Blue-Collar",train$occupation)
  train$occupation = gsub("^Exec-managerial","White-Collar",train$occupation)
  train$occupation = gsub("^Farming-fishing","Blue-Collar",train$occupation)
  train$occupation = gsub("^Handlers-cleaners","Blue-Collar",train$occupation)
  train$occupation = gsub("^Machine-op-inspct","Blue-Collar",train$occupation)
  train$occupation = gsub("^Other-service","Service",train$occupation)
  train$occupation = gsub("^Priv-house-serv","Service",train$occupation)
  train$occupation = gsub("^Prof-specialty","Professional",train$occupation)
  train$occupation = gsub("^Protective-serv","Other-Occupations",train$occupation)
  train$occupation = gsub("^Sales","Sales",train$occupation)
  train$occupation = gsub("^Tech-support","Other-Occupations",train$occupation)
  train$occupation = gsub("^Transport-moving","Blue-Collar",train$occupation)
  table(train$occupation)
  
  table(train$country)
  train$country[train$country=="Cambodia"] = "SE-Asia"
  train$country[train$country=="Canada"] = "British-Commonwealth"    
  train$country[train$country=="China"] = "China"       
  train$country[train$country=="Columbia"] = "South-America"    
  train$country[train$country=="Cuba"] = "Other"        
  train$country[train$country=="Dominican-Republic"] = "Latin-America"
  train$country[train$country=="Ecuador"] = "South-America"     
  train$country[train$country=="El-Salvador"] = "South-America" 
  train$country[train$country=="England"] = "British-Commonwealth"
  train$country[train$country=="France"] = "Euro_1"
  train$country[train$country=="Germany"] = "Euro_1"
  train$country[train$country=="Greece"] = "Euro_2"
  train$country[train$country=="Guatemala"] = "Latin-America"
  train$country[train$country=="Haiti"] = "Latin-America"
  train$country[train$country=="Holand-Netherlands"] = "Euro_1"
  train$country[train$country=="Honduras"] = "Latin-America"
  train$country[train$country=="Hong"] = "China"
  train$country[train$country=="Hungary"] = "Euro_2"
  train$country[train$country=="India"] = "British-Commonwealth"
  train$country[train$country=="Iran"] = "Other"
  train$country[train$country=="Ireland"] = "British-Commonwealth"
  train$country[train$country=="Italy"] = "Euro_1"
  train$country[train$country=="Jamaica"] = "Latin-America"
  train$country[train$country=="Japan"] = "Other"
  train$country[train$country=="Laos"] = "SE-Asia"
  train$country[train$country=="Mexico"] = "Latin-America"
  train$country[train$country=="Nicaragua"] = "Latin-America"
  train$country[train$country=="Outlying-US(Guam-USVI-etc)"] = "Latin-America"
  train$country[train$country=="Peru"] = "South-America"
  train$country[train$country=="Philippines"] = "SE-Asia"
  train$country[train$country=="Poland"] = "Euro_2"
  train$country[train$country=="Portugal"] = "Euro_2"
  train$country[train$country=="Puerto-Rico"] = "Latin-America"
  train$country[train$country=="Scotland"] = "British-Commonwealth"
  train$country[train$country=="South"] = "Euro_2"
  train$country[train$country=="Taiwan"] = "China"
  train$country[train$country=="Thailand"] = "SE-Asia"
  train$country[train$country=="Trinadad&Tobago"] = "Latin-America"
  train$country[train$country=="United-States"] = "United-States"
  train$country[train$country=="Vietnam"] = "SE-Asia"
  train$country[train$country=="Yugoslavia"] = "Euro_2"
  
  table(train$country)
  
  train$education = gsub("^10th","Dropout",train$education)
  train$education = gsub("^11th","Dropout",train$education)
  train$education = gsub("^12th","Dropout",train$education)
  train$education = gsub("^1st-4th","Dropout",train$education)
  train$education = gsub("^5th-6th","Dropout",train$education)
  train$education = gsub("^7th-8th","Dropout",train$education)
  train$education = gsub("^9th","Dropout",train$education)
  train$education = gsub("^Assoc-acdm","Associates",train$education)
  train$education = gsub("^Assoc-voc","Associates",train$education)
  train$education = gsub("^Bachelors","Bachelors",train$education)
  train$education = gsub("^Doctorate","Doctorate",train$education)
  train$education = gsub("^HS-Grad","HS-Graduate",train$education)
  train$education = gsub("^Masters","Masters",train$education)
  train$education = gsub("^Preschool","Dropout",train$education)
  train$education = gsub("^Prof-school","Prof-School",train$education)
  train$education = gsub("^Some-college","HS-Graduate",train$education)
  train$marital[train$marital=="Never-married"] = "Never-Married"
  train$marital[train$marital=="Married-AF-spouse"] = "Married"
  train$marital[train$marital=="Married-civ-spouse"] = "Married"
  train$marital[train$marital=="Married-spouse-absent"] = "Not-Married"
  train$marital[train$marital=="Separated"] = "Not-Married"
  train$marital[train$marital=="Divorced"] = "Not-Married"
  train$marital[train$marital=="Widowed"] = "Widowed"
  
  train$race[train$race=="White"] = "White"
  train$race[train$race=="Black"] = "Black"
  train$race[train$race=="Amer-Indian-Eskimo"] = "Amer-Indian"
  train$race[train$race=="Asian-Pac-Islander"] = "Asian"
  train$race[train$race=="Other"] = "Other"
  

  
  train[["capital_gain"]] <- ordered(cut(train$capital_gain,c(-Inf, 0, 
                                                            median(train[["capital_gain"]][train[["capital_gain"]] >0]), 
                                                            Inf)),labels = c("None", "Low", "High"))
  train[["capital_loss"]] <- ordered(cut(train$capital_loss,c(-Inf, 0, 
                                                            median(train[["capital_loss"]][train[["capital_loss"]] >0]), 
                                                            Inf)), labels = c("None", "Low", "High"))

  
  
  
  

test = read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.test",
                   sep=",",header=F,col.names=c("age", "type_employer", "fnlwgt", "education", 
                                                "education_num","marital", "occupation", "relationship", "race","sex",
                                                "capital_gain", "capital_loss", "hr_per_week","country", "income"),
                   fill=FALSE, strip.white=T, skip=1)

#the fnlwgt weight is not necessary for our purposes. 
test$fnlwgt <- NULL
#education_num is already represented by the factor variable education
test$education_num <- NULL


test$type_employer = as.character(test$type_employer)
test$occupation = as.character(test$occupation)
test$country = as.character(test$country)
test$education = as.character(test$education)
test$race = as.character(test$race)
test$marital = as.character(test$marital)

table(test$type_employer)
test$type_employer = gsub("^Federal-gov","Federal-Govt",test$type_employer)
test$type_employer = gsub("^Local-gov","Other-Govt",test$type_employer)
test$type_employer = gsub("^State-gov","Other-Govt",test$type_employer)
test$type_employer = gsub("^Private","Private",test$type_employer)
test$type_employer = gsub("^Self-emp-inc","Self-Employed",test$type_employer)
test$type_employer = gsub("^Self-emp-not-inc","Self-Employed",test$type_employer)
test$type_employer = gsub("^Without-pay","Not-Working",test$type_employer)
test$type_employer = gsub("^Never-worked","Not-Working",test$type_employer)

table(test$type_employer)



table(test$occupation)

test$occupation = gsub("^Adm-clerical","Admin",test$occupation)
test$occupation = gsub("^Armed-Forces","Military",test$occupation)
test$occupation = gsub("^Craft-repair","Blue-Collar",test$occupation)
test$occupation = gsub("^Exec-managerial","White-Collar",test$occupation)
test$occupation = gsub("^Farming-fishing","Blue-Collar",test$occupation)
test$occupation = gsub("^Handlers-cleaners","Blue-Collar",test$occupation)
test$occupation = gsub("^Machine-op-inspct","Blue-Collar",test$occupation)
test$occupation = gsub("^Other-service","Service",test$occupation)
test$occupation = gsub("^Priv-house-serv","Service",test$occupation)
test$occupation = gsub("^Prof-specialty","Professional",test$occupation)
test$occupation = gsub("^Protective-serv","Other-Occupations",test$occupation)
test$occupation = gsub("^Sales","Sales",test$occupation)
test$occupation = gsub("^Tech-support","Other-Occupations",test$occupation)
test$occupation = gsub("^Transport-moving","Blue-Collar",test$occupation)
table(test$occupation)

table(test$country)
test$country[test$country=="Cambodia"] = "SE-Asia"
test$country[test$country=="Canada"] = "British-Commonwealth"    
test$country[test$country=="China"] = "China"       
test$country[test$country=="Columbia"] = "South-America"    
test$country[test$country=="Cuba"] = "Other"        
test$country[test$country=="Dominican-Republic"] = "Latin-America"
test$country[test$country=="Ecuador"] = "South-America"     
test$country[test$country=="El-Salvador"] = "South-America" 
test$country[test$country=="England"] = "British-Commonwealth"
test$country[test$country=="France"] = "Euro_1"
test$country[test$country=="Germany"] = "Euro_1"
test$country[test$country=="Greece"] = "Euro_2"
test$country[test$country=="Guatemala"] = "Latin-America"
test$country[test$country=="Haiti"] = "Latin-America"
test$country[test$country=="Holand-Netherlands"] = "Euro_1"
test$country[test$country=="Honduras"] = "Latin-America"
test$country[test$country=="Hong"] = "China"
test$country[test$country=="Hungary"] = "Euro_2"
test$country[test$country=="India"] = "British-Commonwealth"
test$country[test$country=="Iran"] = "Other"
test$country[test$country=="Ireland"] = "British-Commonwealth"
test$country[test$country=="Italy"] = "Euro_1"
test$country[test$country=="Jamaica"] = "Latin-America"
test$country[test$country=="Japan"] = "Other"
test$country[test$country=="Laos"] = "SE-Asia"
test$country[test$country=="Mexico"] = "Latin-America"
test$country[test$country=="Nicaragua"] = "Latin-America"
test$country[test$country=="Outlying-US(Guam-USVI-etc)"] = "Latin-America"
test$country[test$country=="Peru"] = "South-America"
test$country[test$country=="Philippines"] = "SE-Asia"
test$country[test$country=="Poland"] = "Euro_2"
test$country[test$country=="Portugal"] = "Euro_2"
test$country[test$country=="Puerto-Rico"] = "Latin-America"
test$country[test$country=="Scotland"] = "British-Commonwealth"
test$country[test$country=="South"] = "Euro_2"
test$country[test$country=="Taiwan"] = "China"
test$country[test$country=="Thailand"] = "SE-Asia"
test$country[test$country=="Trinadad&Tobago"] = "Latin-America"
test$country[test$country=="United-States"] = "United-States"
test$country[test$country=="Vietnam"] = "SE-Asia"
test$country[test$country=="Yugoslavia"] = "Euro_2"

table(test$country)

test$education = gsub("^10th","Dropout",test$education)
test$education = gsub("^11th","Dropout",test$education)
test$education = gsub("^12th","Dropout",test$education)
test$education = gsub("^1st-4th","Dropout",test$education)
test$education = gsub("^5th-6th","Dropout",test$education)
test$education = gsub("^7th-8th","Dropout",test$education)
test$education = gsub("^9th","Dropout",test$education)
test$education = gsub("^Assoc-acdm","Associates",test$education)
test$education = gsub("^Assoc-voc","Associates",test$education)
test$education = gsub("^Bachelors","Bachelors",test$education)
test$education = gsub("^Doctorate","Doctorate",test$education)
test$education = gsub("^HS-Grad","HS-Graduate",test$education)
test$education = gsub("^Masters","Masters",test$education)
test$education = gsub("^Preschool","Dropout",test$education)
test$education = gsub("^Prof-school","Prof-School",test$education)
test$education = gsub("^Some-college","HS-Graduate",test$education)
test$marital[test$marital=="Never-married"] = "Never-Married"
test$marital[test$marital=="Married-AF-spouse"] = "Married"
test$marital[test$marital=="Married-civ-spouse"] = "Married"
test$marital[test$marital=="Married-spouse-absent"] = "Not-Married"
test$marital[test$marital=="Separated"] = "Not-Married"
test$marital[test$marital=="Divorced"] = "Not-Married"
test$marital[test$marital=="Widowed"] = "Widowed"

test$race[test$race=="White"] = "White"
test$race[test$race=="Black"] = "Black"
test$race[test$race=="Amer-Indian-Eskimo"] = "Amer-Indian"
test$race[test$race=="Asian-Pac-Islander"] = "Asian"
test$race[test$race=="Other"] = "Other"


test$age <- scale(test$age)
test[["capital_gain"]] <- ordered(cut(test$capital_gain,c(-Inf, 0, 
                                                            median(test[["capital_gain"]][test[["capital_gain"]] >0]), 
                                                            Inf)),labels = c("None", "Low", "High"))

test[["capital_loss"]] <- ordered(cut(test$capital_loss,c(-Inf, 0, 
                                                            median(test[["capital_loss"]][test[["capital_loss"]] >0]), 
                                                            Inf)), labels = c("None", "Low", "High"))

is.na(train) = train=='?'
is.na(train) = train==' ?'
train = na.omit(train)

train$marital = factor(train$marital)
train$education = factor(train$education)
train$country = factor(train$country)
train$type_employer = factor(train$type_employer)
train$occupation = factor(train$occupation)
train$race = factor(train$race)
train$sex = factor(train$sex)
train$relationship = factor(train$relationship)
train$income = as.factor(ifelse(train$income==train$income[1],0,1))

test$marital = factor(test$marital)
test$education = factor(test$education)
test$country = factor(test$country)
test$type_employer = factor(test$type_employer)
test$occupation = factor(test$occupation)
test$race = factor(test$race)
test$sex = factor(test$sex)
test$relationship = factor(test$relationship)
test$income = as.factor(ifelse(test$income==test$income[1],0,1))