## makeCacheMatrix() creates a special Cachable Matrix
## cacheSolve() calculate the makeCacheMatrix inverse if it is not cached
## test() is a test showing how different pieces work

## makeCacheMatrix gets a matrix as input and returns a list 
## of methods to get/set the matrix  and its invers

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


## cacheSolve gets a makeCacheMatrix as input and calculates its invers

cacheSolve <- function(M, ...) {
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

test <- function() {
    M <- makeCacheMatrix()
    M$set(matrix(runif(25),5,5))
    cacheSolve(M)
    ## should return the cached data
    cacheSolve(M)      
}
