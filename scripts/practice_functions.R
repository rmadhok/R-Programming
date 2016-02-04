add2 <- function(x,y){
    x+y
}

above <- function(x, n = 10){
    use <- x > n
    x[use]
}

make.power <- function(n){
    pow <- function(x){
        x^n
    }
    pow
}
