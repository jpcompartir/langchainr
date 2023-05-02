# Test 1: Default initialization
test_that("BaseLLM initializes with default values", {
  model <- BaseLLM$new()
  expect_equal(model$get_verbosity(), FALSE)
  expect_equal(model$cache, list())
})

# Test 2: Custom initialization
test_that("BaseLLM initializes with custom values", {
  model <- BaseLLM$new(verbose = TRUE, cache = list("test" = 1))
  expect_equal(model$get_verbosity(), TRUE)
  expect_equal(model$cache, list("test" = 1))
})

# Test 3: Callback manager
test_that("BaseLLM creates a callback manager", {
  model <- BaseLLM$new()
  cm <- model$callback_manager("on_start", arg1 = "test", arg2 = 123)
  expect_type(cm, "list")
  expect_equal(cm$event, "on_start")
  expect_equal(cm$arg1, "test")
  expect_equal(cm$arg2, 123)
})
