## Enables a matrix to cache its inverse

##Step 1: Create cache for a matrix and its inverse

makeCacheMatrix<- function(x = matrix()) {
  

  invcache <- NULL
  
  
  setMatrix <- function(newValue) {
    x <<- newValue
    invcache <<- NULL
  }
  
  getMatrix <- function() {
    x
  }
  
  cacheInverse <- function(solve) {
    invcache <<- solve
    
  }
  
  getInverse <- function() {
    invcache
  }
  
  list(setMatrix = setMatrix
       , getMatrix = getMatrix
       , cacheInverse = cacheInverse
       , getInverse = getInverse)
}

# Step 2: Calculates inverse or pulls it if it has already been 
# calculated


cacheSolve <-function(y, ...) {
  inv <-y$getInverse()
  if (!is.null(inv)) {
    message("getting cache data")
    return(inv)
    
  }
  data <-y$getMatrix()
  inv <- solve(data)
  y$cacheInverse(inv)
  
  inv
}
