context("test-syns")

test_that("syns pulls the right number of words for cool", {
  expect_length(syns("cool"), 1)
  expect_length(syns("cool")[[1]], 618)
})

test_that("syns pulls the right number of words for cool with n_words", {
  expect_length(syns("cool", 1), 1)
  expect_length(syns("cool", 1)[[1]], 1)
  expect_length(syns("cool", 5)[[1]], 5)
  expect_length(syns("cool", 10)[[1]], 10)
})

test_that("syns works with two words", {
  expect_length(syns(c("cool", "evil")), 2)
})

test_that("syns n_words works", {
  expect_length(syns(c("cool", "evil"), 5), 2)
  expect_length(syns(c("cool", "evil"), 5)[[1]], 5)
  expect_length(syns(c("cool", "evil"), 5)[[2]], 5)
})


test_that("syns returns 0 when it cannot find a word", {
  expect_length(syns("xxxx"), 1)
  expect_length(syns("xxxx")[[1]], 0)
})

test_that("syns with n_words returns 0 when it cannot find a word", {
  expect_length(syns("xxxx", 5), 1)
  expect_length(syns("xxxx", 5)[[1]], 0)
})

