test_that(
  "test.has_attributes.struct_with_attrs.returns_true_if_attr_exists",
  {
    x <- structure(list(a = 1), foo = 1, bar = 2)
    attrs <- c("names", "foo", "bar", "baz", NA)
    expected <- c(TRUE, TRUE, TRUE, FALSE, FALSE)
    names(expected) <- attrs
    expect_equal(
      has_attributes(x, c("names", "foo", "bar", "baz", NA)),
      expected
    )
  }
)
