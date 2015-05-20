## Function One: Create a Special Matrix Object that can Cache its Inverse

## First Line Given in File

makeCacheMatrix <- function(x = matrix()) {

	## Assign M as a Null Vector (Temporarily)

	m <- NULL
	
	## Set the Value of the Cached Matrix
	## x is superassigned to y and m is superassigned to null. This is done to allow 
	## for the solving to take place within the environment set out by the second-level function
	## and not within the global environment.
	## Source: http://article.gmane.org/gmane.comp.lang.r.general/227066
	## This source helped me learn what the superassignment operator does.	
	
	set <- function(y) {
		x <<- y
		m <<- NULL
            }
	## Get the Value of the Cached Matrix

	get <- function() x

	## Set the Value of the Inverted Matrix (Permutation of Mean Example in Assignment Two Handout)
	## "M <<- solve" Allows for the solving to take place within the environment set out by the
	## function and not within the global environment.
	## Source: http://article.gmane.org/gmane.comp.lang.r.general/227066

	setmatrix <- function(solve) m <<- solve

	## Get the Value of the Inverted Matrix

	getmatrix <- function() m

	## Gives a Generic List that Stores the functions Set, Get, Set Matrix and Get Matrix

	list(set = set, get = get,
	setmatrix = setmatrix,
	getmatrix = getmatrix)
}

## Function Two: Computes the inverse of the special matrix returned by makeCacheMatrix

## First Line Given in File

cacheSolve <- function(x, ...) {

## Assigns the Value of the Inverted Matrix to Object M

            m <- x$getmatrix()

## Gets Cached Matrix Provided that you are NOT dealing with a Null Matrix
## Gives the Message "Getting cached Matrix" if you do not have a Null Matrix
## Returns m for a non-null matrix

            if(!is.null(m)) {
                    message("getting cached Matrix")
                    return(m)
            }
            data <- x$get()

## Compute the Inverse of the Special Matrix Returned by makeCacheMatrix

            m <- solve(data, ...)
            x$setmatrix(m)
            m
    }
