response2 <- read.csv("~/Downloads/typeformResponses.csv")
response1<- read.csv("~/Downloads/googleFormResponses.csv")
write.csv("response1")
names(response1)
names(response2) <- names(response1)
responses <- rbind(response2, response1)
head(responses)
responses <- as.data.frame(responses)
write.csv(responses, "~/R_PROJECTS/HealthInsurance/responses.csv")
write.csv

head(responses)

#check for missing values
is.na(responses)
responses[1,6]
responses[responses == ""] <- NA
any(is.na(responses))

#duplicate data
data <- responses

#dataset for people with negative experiences
negResponses<- subset(responses, negExperience == "1" | negExperience == "Yes")
print(paste0("A total of ",nrow(negResponses)," observations had a negative experience"))

#dataset for people with positive experiencec
posResponses<-  subset(responses, negExperience == "0" | negExperience == "No")
print(paste0("A total of ",nrow(posResponses)," observations had a positive experience"))

for (i in 1:nrow(data)){
  if((data$negExperience[i]) == "No" || data$negExperience == "0"){
    data$whatNegExperience[i] <- "-9"
  }
}

View(data)
print(responses$whatNegExperience[2])

#Encode dataset
data$age <- factor(data$age, 
                   levels = c("18-24","18 - 24", "25-34", "25 - 34", "35-44","35 - 44", "45 - 54", "55 and above", "55-64"),
                   labels = c(1,1,2,2,3,3,4,4,4))
labels<- unique(data$annualIncome)

# inputed missing values based on common sense
data$consideredInsurance[91] <- "Yes" #rationale: only missing value and observation gave reason for using insurance

data$annualIncome <- factor(data$annualIncome,
                            levels = c("Less than 150k", #1
                                      "150k - 1.2m", #2
                                      "1.2m - 150k", #2
                                      "1.2m - 12m", #3
                                      "12m - 1.2m", #3
                                      "12m - 59.9m", #4
                                      "Greater than 60m"), #4
                               labels = c(1, 2, 2, 3, 3, 4, 4))
data$consideredInsurance <- factor(data$consideredInsurance,
                                   levels = c("Yes", "No", "Not sure"),
                                   labels = c(1,0, 0))
data$HeardInsurance <- factor(data$HeardInsurance, 
                              levels = c("Yes", "No", "Not Sure"),
                              labels = c(1, 0, 0))
snapshot1 <- data
unique_levels <- unique(data$importantFactorInsurance)

#remove nas
unique_levels <- unique_levels[-which(is.na(unique_levels))]
# [1] "Coverage"                           "Ease of access to Medical services" "Reputation of Insurance Company"   
#[4] "Cost"                               "I can’t even afford"                "I have not considered it"          
#[7] "Ease of access to medical services" "All of the above"                   "Reputation of insurance company"   
#[10] "Unconventional Insurance"           "Don't have Insurance " 
data$importantFactorInsurance <- factor(data$importantFactorInsurance,
                                        levels = unique_levels,
                                        labels = c(1,2,3,4,4,5,2,6,3,8,9)
                                        )
unique_levels <- unique(data$HowImproveInsurance)
unique_levels <- unique_levels[-which(is.na(unique_levels))]
#[1] "Increase public awareness of the benefits of Insurance"                                     
#[2] "Provide tax incentives for individuals who take out insurance policies"                     
#[3] "Improve regulatory framework for insurance companies"                                       
#[4] "Increase public awareness of the benefits of insurance"                                     
#[5] "All of the above"                                                                           
#[6] "Improve the regulatory framework for insurance companies"                                   
#[7] "Enact policies that ensure popular participation of the masses in health insurance schemes "
#[8] "Inclusion of ethical insurance "                                                            
#[9] "Maybe offers options to every class of people" 

data$HowImproveInsurance <- factor(data$HowImproveInsurance ,
                                        levels = unique_levels,
                                        labels = c(1,2,3,1,4,3,1,5,6)
)

unique_levels <- unique(data$whyNoInsurance)
unique_levels <- unique_levels[-which(is.na(unique_levels))]
unique_levels <- unique_levels[-which(unique_levels == "..")]
unique_levels <- unique_levels[-c(7,9,13,14,10,18)]
#[1] "Lack of awareness"     1                            "Lack of trust in insurance companies"      2       
#[3] "High cost"     3                                    "I’ve just never thought of it"       1             
#[5] "Limited coverage"        4                          "All of the above"        5                         
#[7] "Lack of trust in insurance companie"       2                                           
#[9] "I don’t want to "      5                            "Doesn't really bother me that much. plus cost."   3
#[11] "I do not believe in conventional insurance"    6    "I dont have access to it."    1                    
#[13] "Haven’t taken out insurance "  5                              
#[15] "I’ve never considered it and I don’t earn enough " 3 "Dont believe in it"  6

data$whyNoInsurance <- factor(data$whyNoInsurance ,
                                   levels = unique_levels,
                                   labels = c(1,2,3,1,4,5,2,5,3,6,1,5,3,6))

unique_levels <- unique(data$WhyInsurance)
unique_levels <- unique_levels[-c(2,7,8,9,10,11,12,13,14,15, 16, 17)]

#[1] "To cover medical expenses"  1                              "Because it was required by my employer"   2               
#[3] "To have peace of mind"   3                                 "Because it was required by my employee"   4               
#[5] "As a savings plans and also for unforseen contingencies 5"                                 

data$WhyInsurance <- factor(data$WhyInsurance ,
                              levels = unique_levels,
                              labels = c(1,2,3,4,5))




data$HeardInsurance[data$HeardInsurance == NA] <- "-9"
for (i in 1:nrow(data)){
  if((data$negExperience[i]) == "No"){
    data$whatNegExperience[i] <- "-9"
  }
}

data$whyNoInsurance[data$whyNoInsurance == NA] <- "-9"
responses$age
unique(responses$age)

#remove first column
data<- data[,-1]





