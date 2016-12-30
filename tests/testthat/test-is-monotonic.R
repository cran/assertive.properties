test_that("test is_monotonic_increasing with non-strictly monotonic inc vector returns true", {
  x <- c(1, 1, 2, 2, 3, 5, 5)
  expect_true(is_monotonic_increasing(x))
})

test_that("test is_monotonic_increasing and strictly = TRUE with non-strictly monotonic inc vector returns false", {
  x <- c(1, 1, 2, 2, 3, 5, 5)
  expect_false(actual <- is_monotonic_increasing(x, strictly = TRUE))
  expect_match(
    assertive.base::cause(actual),
    "The values of x are not strictly monotonic increasing\\.\\n +Position +ValueBefore +ValueAfter"
  )
})

test_that("test is_monotonic_increasing with non monotonic inc vector returns false", {
  x <- c(1, 1, 2, 2, 3, 1, 5)
  expect_false(actual <- is_monotonic_increasing(x))
  expect_match(
    assertive.base::cause(actual),
    "The values of x are not monotonic increasing\\.\\n +Position +ValueBefore +ValueAfter"
  )
})

test_that("test is_monotonic_increasing with missing values returns na", {
  x <- c(1, 1, 2, 2, 3, NA, 5)
  expect_true(is.na(actual <- is_monotonic_increasing(x)))
  expect_match(
    assertive.base::cause(actual),
    "There are missing values, so monotonicity cannot be determined\\."
  )
})


test_that("test is_monotonic_decreasing with non-strictly monotonic inc vector returns true", {
  x <- c(5, 5, 3, 2, 2, 1, 1)
  expect_true(is_monotonic_decreasing(x))
})

test_that("test is_monotonic_decreasing and strictly = TRUE with non-strictly monotonic inc vector returns false", {
  x <- c(5, 5, 3, 2, 2, 1, 1)
  expect_false(actual <- is_monotonic_decreasing(x, strictly = TRUE))
  expect_match(
    assertive.base::cause(actual),
    "The values of x are not strictly monotonic decreasing\\.\\n +Position +ValueBefore +ValueAfter"
  )
})

test_that("test is_monotonic_decreasing with non monotonic inc vector returns false", {
  x <- c(5, 1, 3, 2, 2, 1, 1)
  expect_false(actual <- is_monotonic_decreasing(x))
  expect_match(
    assertive.base::cause(actual),
    "The values of x are not monotonic decreasing\\.\\n +Position +ValueBefore +ValueAfter"
  )
})

test_that("test is_monotonic_decreasing with missing values returns na", {
  x <- c(5, NA, 3, 2, 2, 1, 1)
  expect_true(is.na(actual <- is_monotonic_decreasing(x)))
  expect_match(
    assertive.base::cause(actual),
    "There are missing values, so monotonicity cannot be determined\\."
  )
})
