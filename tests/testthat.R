library(testthat)
library(devtools)
library(assertive.base)
library(assertive.properties)

with_envvar(
  c(LANG = "en_US"),
  test_check("assertive.properties")
)
