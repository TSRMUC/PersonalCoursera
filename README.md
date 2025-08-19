# PersonalCooursera
# Programming Assignment 2: Lexical Scoping

This repo contains `cachematrix.R` implementing:
- `makeCacheMatrix(x = matrix())`: creates a special matrix object that can cache its inverse.
- `cacheSolve(x, ...)`: computes the inverse of the special matrix or returns the cached value.

## Demo
```r
source("cachematrix.R")
m <- matrix(c(1,2,3,4), 2, 2)
cm <- makeCacheMatrix(m)
cacheSolve(cm)     # computes
cacheSolve(cm)     # returns cached ("getting cached data")
cm$set(diag(2))    # change matrix -> cache emtied
cacheSolve(cm)     # recomputes
=======
# PersonalCoursera
>>>>>>> ce429b00649be0888c2adf05fa988ab8684dcc54
