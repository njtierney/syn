context("test-syn")

test_that("syn pulls the right number of words for cool", {
  expect_length(syn("cool"), 618)
})

test_that("syn pulls the right number of words for cool with n_words", {
  expect_length(syn("cool", 1), 1)
  expect_length(syn("cool", 2), 2)
  expect_length(syn("cool", 100), 100)
})
