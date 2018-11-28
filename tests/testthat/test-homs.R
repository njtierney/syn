context("test-homs")

test_that("homs pulls the right number of words for cool", {
  expect_length(homs("cool"), 1)
  expect_length(homs("cool")[[1]], 69)
})

test_that("homs pulls the right number of words for cool with n_words", {
  expect_length(homs("cool", 1), 1)
  expect_length(homs("cool", 1)[[1]], 1)
  expect_length(homs("cool", 5)[[1]], 5)
})

test_that("homs works with two words", {
  expect_length(homs(c("cool", "evil")), 2)
})

test_that("homs n_words works", {
  expect_length(homs(c("cool", "evil"), 5), 2)
  expect_length(homs(c("cool", "evil"), 5)[[1]], 5)
  expect_length(homs(c("cool", "evil"), 5)[[2]], 5)
})

test_that("homs returns character(0) when it cannot find a word", {
  expect_length(homs("xxxx"), 1)
  expect_length(homs("xxxx")[[1]], 0)
  expect_is(homs("xxxx")[[1]], "character")
})

test_that("homs with n_words returns character(0) when it cannot find a word", {
  expect_length(homs("xxxx", 5), 1)
  expect_length(homs("xxxx", 5)[[1]], 0)
  expect_is(homs("xxxx")[[1]], "character")
})

