d <- matrix(c(-1,0,-5,3,-6,-3,-3,5,1), nrow=3, ncol=3)
bigmat <- makeCacheMatrix(d)
cacheSolve(bigmat)