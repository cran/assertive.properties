[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Is the package on CRAN?](http://www.r-pkg.org/badges/version/assertive.properties)](http://www.r-pkg.org/pkg/assertive.properties)

# assertive.properties

A set of predicates and assertions for checking the properties of variables, such as length, names and attributes.  Most of the documentation is on the *[assertive](https://bitbucket.org/richierocks/assertive)* page.  End-users will usually want to use *assertive* directly.


### Installation

To install the stable version, type:

```{r}
install.packages("assertive.properties")
```

To install the development version, you first need the *devtools* package.

```{r}
install.packages("devtools")
```

Then you can install the *assertive.properties* package using

```{r}
library(devtools)
install_bitbucket("richierocks/assertive.properties")
```

### Predicates

`has_attributes` checks a variable for the presence of named attributes.  `has_any_attributes` and `has_no_attributes` check for the presence or absence of any attributes at all.

`has_dims`, `has_rows`, and `has_cols` check for the dimensions, rows and columns respectively.

`has_duplicates` and `has_no_duplicates` check whether or not a vector has duplicate elements.

`has_names`, `has_dimnames`, `has_rownames`, and `has_colnames` check for various types of name.

`is_atomic`, `is_recursive`, and `is_vector` check for these types of variables.

`is_empty`, `is_non_empty`, `is_scalar`, and `is_non_scalar` check for objects of length 0 or 1 (or objects with 0/1 element).  

`is_of_length`, `has_elements`, and `is_of_dimension` provide more general variable size checks.

`are_same_length` and `have_same_dims` check for two variables having the same length/dimensions.

`is_null` and `is_not_null` check whether an object is `NULL` or not.

`is_unsorted` checks for unsorted vectors.

### Assertions

Predicates that return a vector have two corresponding assertions.  For example,
`has_attributes` has `assert_has_all_attributes` and `assert_has_any_attributes`.

Predicates returning a single logical value have one corresponding assertion.
For example, `is_null` has `assert_is_null`.

### Utilities

`DIM` returns the dimension of an object, and works with vectors (like `NROW` and `NCOL`).

`n_elements` returns the number of elements in an object.
