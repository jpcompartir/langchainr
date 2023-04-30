# Load the R6 package for creating classes
library(R6)

# Explanation of the BaseLLM R6 Class
# -----------------------------------
# 1. 'BaseLLM' is the name of the class.
#
# 2. 'public = list()' is used to define the public members (properties and methods) of the class.
#
# 3. 'cache', 'verbose', and 'callback_manager' are the public properties of the class.
#
# 4. 'initialize()' is the constructor method for the class, which is called when a new instance of the class is created.
#    It accepts three parameters: 'cache', 'verbose', and 'callback_manager'.
#    - 'cache' is a list to store cached data.
#    - 'verbose' is a boolean flag to control verbosity.
#    - 'callback_manager' is a function to handle events and callbacks.
#    If 'callback_manager' is not provided, it defaults to a simple function that returns a list with the event and other arguments.
#
# 5. 'get_verbosity()' is a public method to return the value of the 'verbose' property.


# Define the BaseLLM class using R6
BaseLLM <- R6::R6Class("BaseLLM",
                       public = list(
                         cache = NULL,
                         verbose = NULL,
                         callback_manager = NULL,
                         initialize = function(cache = list(), verbose = FALSE, callback_manager = NULL) {
                           self$cache <- cache
                           self$verbose <- verbose

                           if (is.null(callback_manager)) {
                             self$callback_manager <- function(event, ...) {
                               return(list(event = event, ...))
                             }
                           } else {
                             self$callback_manager <- callback_manager
                           }
                         },

                         get_verbosity = function() {
                           return(self$verbose)
                         }
                       )
)

