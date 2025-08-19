## makeCacheMatrix: create a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  set <- function(y) {
    # Assign to the parent env: replace matrix and reset cached inverse
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  
  setinverse <- function(value) {
    inv <<- value
  }
  
  getinverse <- function() inv
  
  # Return a list of closures that share 'x' and 'inv'
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## cacheSolve: compute (or retrieve) the cached inverse of the matrix in 'x'
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  mat <- x$get()
  
  # Optional guardrails (not strictly required by the assignment)
  if (!is.matrix(mat)) stop("Stored object is not a matrix.")
  if (nrow(mat) != ncol(mat)) stop("Matrix must be square to invert.")
  # If matrix is singular, 'solve' will error; we let it propagate.
  
  inv <- solve(mat, ...)  # compute inverse
  x$setinverse(inv)       # cache it
  inv
}