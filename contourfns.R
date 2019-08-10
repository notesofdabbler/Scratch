#' @import akima
#' @importFrom graphics axis contour filled.contour
NULL

#' convert dataframe to a list that can be used for contour plots
#'
#' @param df
#'
#' @param x
#' @param y
#' @param z
#' @param ...
#'
#' @export
getctrdataL = function(df, x, y, z, ...) {
  ctrdataL = interp(df[[x]], df[[y]], df[[z]], ...)
  return(ctrdataL)
}

#' Generate contour plot using a list input
#' Adapted from https://stackoverflow.com/questions/25302974/how-to-get-contour-lines-and-axis-labels-in-a-filled-contour-plot-in-r
#'
#' @param ctrdataL
#' @param type
#' @param ...
#' @param contourOpts
#'
#' @export
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

#' Generate a contour plot with a dataframe input
#'
#' @param ctrdatadf
#'
#' @param x
#' @param y
#' @param z
#' @param type
#' @param ...
#' @param contourOpts
#' @param interpOpts
#'
#' @export
contourplus = function(ctrdatadf, x, y, z, type = "filled_contour", ...,
                        contourOpts = list(), interpOpts = list()) {
  ctrdataL = do.call(getctrdataL, c(list(ctrdatadf, x, y, z), interpOpts))
  contourplusL(ctrdataL, type, ...,
               contourOpts = contourOpts)
}

