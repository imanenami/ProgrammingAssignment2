## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(M = matrix()) {
  inv <- NULL
  set <- function(y) {
    M <<- y
    inv <<- NULL
  }
  get <- function() M
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    inv <- M$getinverse()
    if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
    }
    mat <- M$get()
    inverse <- solve(mat, ...)
    M$setinverse(inverse)
    inverse
}
