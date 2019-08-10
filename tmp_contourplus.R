# Examples
library(akima)

getctrdataL = function(df, x, y, z, ...) {
  ctrdataL = interp(df[[x]], df[[y]], df[[z]], ...)
  return(ctrdataL)
}

contourplusL = function(ctrdataL, type = "filled_contour", ...,
                        contourOpts = list()) {
  if(type == "filled_contour") {
    filled.contour(ctrdataL,...)
  } else if (type == "contour") {
    do.call(contour, c(ctrdataL, contourOpts))
  } else
    filled.contour(ctrdataL, ...,
                   plot.axes = {
                     do.call(contour, c(ctrdataL, contourOpts, list(drawlabels = TRUE, axes = FALSE,
                                                                    frame.plot = FALSE, add = TRUE)));
                     axis(1); axis(2) }
    )
}

library(contourplus)
df = data.frame(x = runif(100, -10, 10), y = runif(100, -10, 10))
df$z = df$x^2 + 2*df$y^2
ctrdataL = getctrdataL(df, "x", "y", "z")

contourplus(df, "x", "y", "z", type = "both", contourOpts = list(nlevels = 5))
