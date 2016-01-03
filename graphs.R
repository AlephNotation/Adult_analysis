#Graphs and Such

library(ggplot2)

#Capital gain graphs
plot(ex$capital_gain, ylab="Capital Gains ($)", main="Captial Gains in Nominal Dollars")
plot(ex$capital_loss, ylab="Capital Loss ($)", main="Captial Losses in Nominal Dollars")

ggplot(data=train, aes(train$capital_gain)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Capital Gain") +xlab("Capital Gain") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/cap_gain.png")

ggplot(data=test, aes(test$capital_loss)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Capital Loss") +xlab("Capital Loss") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/cap_loss.png")



#Marital Status graphs

ggplot(data=train, aes(ex$marital)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Raw Marital Status")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/marital_raw.png")

ggplot(data=train, aes(train$marital)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Marital Status")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/marital.png")

#Occupatin Graphs
ggplot(data=train, aes(ex$occupation)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Raw Occupation")+ xlab("") +ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/occupation_raw.png")



ggplot(data=train, aes(train$occupation)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Occupation")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/occupation.png")


#Employer Graphs
ggplot(data=train, aes(ex$type_employer)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Raw Type of Employer")+ xlab("") +ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/employer_raw.png")



ggplot(data=train, aes(train$type_employer)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Type of Employer")+ xlab("") +ylab("Frequency") 
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/employer.png")

#Education graphs
ggplot(data=train, aes(ex$education)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Raw Education") + xlab("") +ylab("Frequency")+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/education_raw.png")

ggplot(data=train, aes(train$education)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Education")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/education.png")

#Age Graph
ggplot(data=train, aes(ex$age)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Raw Education")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/age_raw.png")


ggplot(data=train, aes(train$age)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Age")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/age.png")


#Relationship Graphs
ggplot(data=train, aes(train$relationship)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Relationship")+ xlab("") +ylab("Frequency")+theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/relationship.png")


#Race Graphs

ggplot(data=train, aes(train$race)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Race")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/race.png")


#Sex Graphs
ggplot(data=train, aes(train$sex)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Sex")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/sex.png")


#Hours per Week graphs
ggplot(data=train, aes(train$hr_per_week)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Work Week (Hours)")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/hpw.png")

#Income graph
ggplot(data=train, aes(train$income)) + 
  geom_histogram(binwidth=1, 
                 col="black", 
                 aes(fill=..count..)) + 
  ggtitle("Income (USD = 1994)")+ xlab("") +ylab("Frequency")
ggsave(file = "/Users/ty/Desktop/Adult_analysis2/Graphs/income.png")
