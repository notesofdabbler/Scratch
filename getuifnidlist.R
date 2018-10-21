#
# Ability to get ids for different type of inputs (like selectInput, numericInput etc.)
# from ui.R file
#

getid = function(x) {
      id = strsplit(x, ",")[[1]][1]
      idclean = gsub("\"","",id)
      return(idclean)
      }

getuifnId = function(uistr, uifn) {
  uistrsplit = strsplit(x, paste0(uifn, "\\("))[[1]][-1]
  uifnid = rep(NA, length(uistrsplit))
  for(i in 1:length(uistrsplit)) {
      uifnid[i] = getid(uistrsplit[i])
  }
  return(uifnid)
}

# tested with ui.R from
# http://shiny.rstudio.com/gallery/update-input-demo.html
x = paste(readLines("ui.R"), collapse = " ")
getuifnId(x, "sliderInput")
