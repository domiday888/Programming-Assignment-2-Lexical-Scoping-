makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function( matrix ) {
                m <<- matrix
                i <<- NULL
        }
        # get the matrix
        get <- function() {
        # return the matrix
                m
        }
        # set the inverse of the matrix
        setInverse <- function(inverse) {
                i <<- inverse
        }
        
        # get the inverse of the matrix
        getInverse <- function() {
                i
        }
        # return a list
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}
# Back to the  matrix m
m <- x$getInverse()
if( !is.null(m) ) {
        message("getting cached data")
        return(m)
}
# calculate the inverse via matrix multiplication
m <- solve(data) %*% data
# Set the inverse to the object
x$setInverse(m)
m
}



cacheSolve <- function(x, ...) {
        inv = x$getinv()
        
        # if the inverse has already been calculated
        if (!is.null(inv)){
                # get it and skip the calculation. 
                message("getting cached data")
                return(inv)
        }
        
        # otherwise, calculate the inverse 
        mat.data = x$get()
        inv = solve(mat.data, ...)
        
        # sets the value of the inverse 
        x$setinv(inv)
        
        return(inv)
}
