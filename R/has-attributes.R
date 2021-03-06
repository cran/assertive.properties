#' Does the input have any attributes?
#'
#' Checks to see if the input has any attributes.
#'
#' @param x Input to check.
#' @param .xname Not intended to be used directly.
#' @return \code{has_any_attributes} returns \code{TRUE} if \code{attributes(x)}
#' has length greater than zero. \code{has_attributes} returns a logical vector
#' that is \code{TRUE} whenever the specified attribute is not \code{NULL}.
#' @note There are no corresponding \code{assert} functions, since they overlap 
#' too closely with the assertions for \code{\link{has_attributes}}.
#' @seealso \code{\link{has_attributes}} to check for specific attributes.
#' @examples
#' has_any_attributes(matrix())
#' has_no_attributes(data.frame())
#' @export
has_any_attributes <- function(x, .xname = get_name_in_parent(x))
{
  if(is_empty(attributes(x)))
  {
    return(false("%s has no attributes.", .xname))
  }
  TRUE
}

#' @rdname has_any_attributes
#' @export
has_no_attributes <- function(x, .xname = get_name_in_parent(x))
{
  attr_names_x <- names(attributes(x))
  if(!is_empty(attr_names_x))
  {
    return(
      false(
        ngettext(
          length(attr_names_x),
          "%s has the attribute %s.",
          "%s has the attributes %s."
        ), 
        .xname, 
        toString(attr_names_x)
      )
    )
  }
  TRUE
}

#' Does the input have the specified attributes?
#'
#' Checks to see if the input has the specified attributes.
#'
#' @param x Input to check.
#' @param attrs Desired attributes.
#' @param .xname Not intended to be used directly.
#' @param severity How severe should the consequences of the assertion be?  
#' Either \code{"stop"}, \code{"warning"}, \code{"message"}, or \code{"none"}.
#' @return \code{has_attributes} returns \code{TRUE} where \code{x} has
#' the attributes specified in \code{attrs}. \code{assert_has_terms} returns 
#' nothing but throws an error if \code{has_terms} is not \code{TRUE}.
#' @seealso \code{\link{has_any_attributes}} for checking that an object has
#' any attributes at all.
#' @examples
#' # has_attributes is vectorized on attrs
#' has_attributes(sleep, c("class", "names", "row.names", "col.names"))
#' 
#' # You can check for any or all of these attributes to be present.
#' x <- structure(c(a = 1), b = 2)
#' assert_has_all_attributes(x, c("names", "b"))
#' assert_has_any_attributes(x, c("names", "not an attribute"))
#' 
#' # These examples should fail.
#' assertive.base::dont_stop({
#' assert_has_all_attributes(x, c("names", "not an attribute"))
#' })
#' @importFrom assertive.base bapply
#' @importFrom assertive.base set_cause
#' @export
has_attributes <- function(x, attrs, .xname = get_name_in_parent(x))
{
  if(is_empty(attrs)) return(logical())
  set_cause(
    bapply(attrs, function(at) is_not_null(attr(x, at))),
    "no attr"
  )
}
