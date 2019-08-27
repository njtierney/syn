title_case <- syn::syn("Diverge")
lower_case <- syn::syn("diverge")

test_that("syn converts words to lowercase", {
  expect_equal(title_case, lower_case)
})
