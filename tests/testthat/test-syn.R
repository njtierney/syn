context("test-syn")

test_that("syn pulls the right number of words for cool", {
  expect_length(syn("cool"), 618)
})

test_that("syn returns 0 when it cannot find a word", {
  expect_length(syn("xxxx"), 0)
})

test_that("syn pulls the right number of words for cool with n_words", {
  expect_length(syn("cool", 1), 1)
  expect_length(syn("cool", 2), 2)
  expect_length(syn("cool", 100), 100)
})

test_that("syn with n_words returns 0 when it cannot find a word", {
  expect_length(syn("xxxx", 5), 0)
})
