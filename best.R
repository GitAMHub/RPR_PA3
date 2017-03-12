best <- function(state, outcome) {
        
        ## Read outcome data
        outcome <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
        outcome[, 11] <- as.numeric(outcome[, 11])
        outcome[, 11] <- as.numeric(outcome[, 11])
        outcome[, 17] <- as.numeric(outcome[, 17])
        outcome[, 23] <- as.numeric(outcome[, 23])
        
        
        ## Check that state and outcome are valid
        #Outcome= "heart attack, "heart failure", "pneumonia".
        
        
        ## Return hospital name in that state with lowest 30-day death rate
        
}