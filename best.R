best <- function(state, outcome) {
        
        library(ggplot2)
        library(plyr)
        
        # helper function for getting the hospital name
        helper <- function(data, col_num, state) {
                state_subset <- data[data[, 7]==state, ]
                outcome_arr <- state_subset[, col_num]
                min <- min(outcome_arr, na.rm=T)
                min_index <- which(outcome_arr == min)
                hosp_name <- state_subset[min_index, 2]
                return(hosp_name)
        }
        
        ## Read  data
        data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
        #data[, 7] <- factor(levels(data[, 7])[data[, 7]])
        data[, 11] <- as.numeric(data[, 11])  #Outcome= "heart attack
        data[, 17] <- as.numeric(data[, 17])  #Outcome= "heart failure"
        data[, 23] <- as.numeric(data[, 23])  #Outcome= "pneumonia".
        
        #qplot(data[, 7], data[, 11], col=(data[, 12]))
        
        ## Check that state and outcome are valid
        #Outcome= "heart attack, "heart failure", "pneumonia".
        
        OK_OUT <- c("heart attack", "heart failure", "pneumonia")
        if (!state %in% data$State) {
                stop("invalid state")
        } else if(!outcome %in% OK_OUT) {
                stop("invalid outcome")
        } else {
                if(outcome == "heart attack") {
                        hosp_name <- helper(data, 11, state)
                } else if(outcome == "heart failure") {
                        hosp_name <- helper(data, 17, state)
                } else {
                        hosp_name <- helper(data, 23, state)
                }
                
        # Return hospital name in that state with lowest 30-day death rate
                result <-  hosp_name[!is.na(hosp_name)]; result[sort.list(hosp_name, na.last = NA)]
                return(result)
        }
}
