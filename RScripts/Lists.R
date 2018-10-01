library(tidyverse)
library(repurrrsive)
library(purrr)
library(magrittr)

MyList <- list(a = 1:3, b = ("a string"), c = 3.141, d = list(c(-1,-5, 3.7, 2, 4, 2, 2), 
                                                              list(10, list(1,3,4,5), 
                                                                   list(c(3,4,56)))))

#Note that the '$' denotes the components in a list. So to get to the '10' in the 
#list above, one would need to MyList[[4]][[2]]  
#as this is the 2nd element in the 4th element of the list

View(MyList)            #Returns the list
View(MyList[1:2])       #Returns a new list with only the first two elements
View(MyList[4])         #Returns a new list with only the fourth element

View(MyList[[4]])       #Returns the fourth element of the list as a 
str(MyList[[4]])


View(MyList[[4]][1])  #Returns the fourth element of the list as a new list
str(MyList[[4]][1])   #because single brackets have been used.

View(MyList[[4]][[1]])  #Returns the fourth element of the list as a vector
str(MyList[[4]][[1]])   #because you are drilling down.

x <- MyList[["d"]][[1]]
subset(x, x %in% c(2,4))
x[which(x %in% c(2,4))]
x[which  (x %% 2 == 0)]   #get all even numbers
x[which(!(x %% 2 == 0))]  #get all the odd numbers

View(gh_repos)

#This will create a dataframe out of a list.  Types are deterimined
#automtically which can be problematic when programming
x <- map_dfr(got_chars, magrittr::extract, c('name', 'culture'))

#This does the same thing but explicitly defines the types
#Syntax notes: The dot '.' is the placeholder for the primary 
#input: got_chars in this case. The curly braces {} surrounding 
#the tibble() call prevent got_chars from being passed in as 
#the first argument of tibble().
x <- got_chars %>% {
  tibble(
    name = map_chr(., "name"),
    culture = map_chr(., "culture")
  )
}


#gh_repos[[1]][[1]][["owner"]][["login"]] is the same as
#this:  (with iteration added for map)  
x <- map_chr(gh_repos, c(1, 4, 1))



