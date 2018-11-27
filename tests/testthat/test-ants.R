context("test-ants")

test_that("ants pulls the right number of words for cool", {
  expect_length(ants("cool"), 1)
  expect_length(ants("cool")[[1]], 2)
})

test_that("ants pulls the right number of words for cool with n_words", {
  expect_length(ants("cool", 1), 1)
  expect_length(ants("cool", 1)[[1]], 1)
  expect_length(ants("cool", 5)[[1]], 2)
})

test_that("ants works with two words", {
  expect_length(ants(c("cool", "evil")), 2)
})

test_that("ants n_words works", {
  expect_length(ants(c("cool", "evil"), 5), 2)
  expect_length(ants(c("cool", "evil"), 5)[[1]], 2)
  expect_length(ants(c("cool", "evil"), 5)[[2]], 1)
})


test_that("ants returns 0 when it cannot find a word", {
  expect_length(ants("xxxx"), 1)
  expect_length(ants("xxxx")[[1]], 0)
})

test_that("ants with n_words returns 0 when it cannot find a word", {
  expect_length(ants("xxxx", 5), 1)
  expect_length(ants("xxxx", 5)[[1]], 0)
})

