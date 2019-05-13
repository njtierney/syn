context("n-word")

test_that("n_word pulls the right number of words out",{
  expect_equal(object = n_words(c("one", "two words", "three more words")),
               expected = c(1, 2, 3))
})

test_that("n_word handles '-'",{
  expect_equal(object = n_words(c("one", "two-words", "three-more-words")),
               expected = c(1, 1, 1))
  expect_equal(object = n_words(c("one", "two-words", "three-more words")),
               expected = c(1, 1, 2))
})
