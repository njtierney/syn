context("test-hom")

test_that("hom pulls the right number of words for cool", {
  expect_length(hom("cool"), 69)
})

test_that("hom returns character(0) when it cannot find a word", {
  expect_length(hom("xxxx"), 0)
  expect_is(hom("xxxx"), "character")
})

test_that("hom pulls the right number of words for cool with n_words", {
  expect_length(hom("cool", 1), 1)
  expect_length(hom("cool", 2), 2)
  expect_length(hom("cool", 60), 60)
})

test_that("hom with n_words returns 0 when it cannot find a word", {
  expect_length(hom("xxxx", 5), 0)
})
