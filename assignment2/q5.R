correlation_s <- function(x, y, n) {
    sm_x <- sum(x) / n
    sm_y <- sum(y) / n
    s_xy <- sum((x - sm_x)*(y - sm_y))/(n - 1)
    s_x <- sqrt(sum((x - sm_x) ^ 2)/(n - 1))
    s_y <- sqrt(sum((y - sm_y) ^ 2)/(n - 1))
    r <- s_xy / (s_x * s_y)
    return(r)
}