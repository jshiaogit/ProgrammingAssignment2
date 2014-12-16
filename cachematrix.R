## These functions (makeCacheMatrix and cacheSolve) cache the inverse of
## a square invertible matrix.

## makeCacheMatrix defines four functions and returns a list that allows
## cacheSolve to call them.

makeCacheMatrix <- function(x = matrix(), ...) { # input x will be a matrix 
                                                # that is separately created
  i <- NULL   # i will be the inverted matrix and is set to null when 
              # makeCacheMatrix is called
  
  set <- function(y) { # honestly not sure what this function does
    x <<- y
    i <<- NULL
  }
  get <- function() x # this function returns the value of original matrix
  
  setinverse <- function(solve) i <<- solve # the first cacheSolve calls 
                                            # this function
  
  getinverse <- function() i  # this returns a null on the first cacheSolve
                              # and the cached value on the subsequent
                              # cacheSolves
  
  list(set = set, get = get,     # this creates an index of the functions
       setinverse = setinverse,  # that makeCacheMatrix defines 
       getinverse = getinverse)  # and that can be called
}


## cacheSolve returns the inverse of of a matrix either by computing
## it the first time and storing it in a cache
## or by retrieving it from the cache on subsequent calls

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()  # accesses the cached inverse of x
  
  if(!is.null(i)) {    # if the inverse is already cached...
    message("getting cached data")   # ...print message and return it
    return(i)
  }
  data <- x$get()       # if there is nothing in the cache...
  i <- solve(data, ...) # ...compute the inverse, ...
  x$setinverse(i)       # ...store it in the cache, ...
  i                     # ...and return it
}
