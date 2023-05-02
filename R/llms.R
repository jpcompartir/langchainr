#' R6 Class representing a Base Language Model
#'
#' A BaseLLM provides a simple language model implementation with cache, verbosity, and callback manager functionality.
#'
#' @seealso \code{\link{OtherLanguageModels}}
#' @export
#' @family Language Models
BaseLLM <- R6::R6Class("BaseLLM",
                       public = list(
                         #' @field cache A list to store cached data.
                         cache = list(),

                         #' @field verbose A boolean flag to control verbosity.
                         verbose = NULL,

                         #' @description
                         #' Create a new BaseLLM object.
                         #' @param cache A list to store cached data (default: empty list).
                         #' @param verbose A boolean flag to control verbosity (default: FALSE).
                         #' @param callback_manager A function to handle events and callbacks (default: NULL).
                         #' @return A new `BaseLLM` object.
                         initialize = function(cache = list(), verbose = FALSE, callback_manager = NULL) {
                           self$cache <- cache
                           self$verbose <- verbose

                           if (is.null(callback_manager)) {
                             private$callback_manager <- function(event, ...) {
                               return(list(event = event, ...))
                             }
                           } else {
                             private$callback_manager <- callback_manager
                           }
                         },

                         #' @description
                         #' Return the verbosity flag of the instance.
                         #' @return A boolean indicating if verbosity is enabled.
                         #' @examples
                         #' # Create a new BaseLLM instance
                         #' lm <- BaseLLM$new()
                         #' # Check the verbosity
                         #' lm$get_verbosity()
                         get_verbosity = function() {
                           return(self$verbose)
                         }
                       ),

                       private = list(
                         callback_manager = NULL
                       )
)



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


