library(rvest)
library(tidyverse)

url<- "https://code.bioconductor.org/browse/limma/commits/RELEASE_3_17"
website <- read_html("https://code.bioconductor.org/browse/limma/commits/RELEASE_3_17")
View(website)
head2 <- website %>% html_elements('div class =".panel-heading bold"')

head <- html_nodes(website, ".panel")
document <- html_nodes(website, ".panel-heading")
document

head %>% html_element(".panel-heading bold")

g


dropdown

eleent <- html_text(html_children(dropdown))
eleent
dates <- website %>% html_elements(".panel-heading") %>% html_text2()
dates

release_year <- website %>% html_elements("strong") %>% html_text2()
release_year

release_comment <- website %>% html_elements("h4") %>% html_text2()
release_comment



sentence
sentence <- gsub("\n", "", sentence)
sentence
release

url <- "https://bioconductor.org/packages/release/bioc/html/GenomicRanges.html"
webpage <- read_html(url)
css_selector <- "#commit-history"
commit_table <- html_table(html_nodes(webpage, css_selector), fill = TRUE)
commit_table


head[1]
for (i in 1:length(join)){
  name <- paste0(i, "love")
  assign(name, i*2)
  print(name)
}


commit_table$commit<- ifelse(is.na(commit_table$commit), "unknown", commit_table$commit)

if(!is.na(commit_table$commit[i]) && !is.na(commit_table$commit[i-1])){
  #if(strsplit(commit_table$commit[i-1], "")[[1]][1] == strsplit(commit_table$commit[i], "")[[1]][1]){
  if(substr(commit_table$commit[i], 1, 1) == substr(commit_table$commit[i-1], 1, 1)){
    commit_table$major_release[i]<- FALSE
  } else{
    commit_table$major_release[i]<- TRUE
  }
} else{
  commit_table$major_release[i] <- FALSE
  
  
  
  list <- list(m = c(1,2,3,4,5), y = c(3,4,5,6,7))
  addition <- function(j){
    value <- j + 7
    return(value)
  }
  result <- map_df(list, ~ addition(.x))
  
  
}