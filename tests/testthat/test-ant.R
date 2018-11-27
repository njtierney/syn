context("test-ant")

test_that("ant pulls the right number of words for cool", {
  expect_length(ant("cool"), 2)
})

test_that("ant returns 0 when it cannot find a word", {
  expect_length(ant("xxxx"), 0)
})

test_that("ant pulls the right number of words for cool with n_words", {
  expect_length(ant("cool", 1), 1)
  expect_length(ant("cool", 2), 2)
  expect_length(ant("cool", 100), 2)
})

test_that("ant with n_words returns 0 when it cannot find a word", {
  expect_length(ant("xxxx", 5), 0)
})
