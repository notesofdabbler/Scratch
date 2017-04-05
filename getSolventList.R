
library(rvest)
library(stringr)

url = "http://www.sigmaaldrich.com/chemistry/solvents/products.html?TablePage=14577688"

pg = read_html(url)

solvlist = pg %>% html_nodes(".OPCPDLink") %>% html_text()
solvlist_url = pg %>% html_nodes(".OPCPDLink") %>% html_attr("href")
solvlist_url = paste0("http://www.sigmaaldrich.com",solvlist_url)

numsolv = length(solvlist_url)

solvnameV = rep(NA, numsolv)
synnamesL = list()
casnumV = rep(NA, numsolv)

for(i in 1:numsolv){
  
  print(paste0(i," ",solvlist[i]))
  
  solvurl = solvlist_url[i]
  solvpg = read_html(solvurl)
  solvname = solvpg %>% html_nodes(".productInfo h1[itemprop = 'name']") %>% html_text()
  solvname = gsub("[\t\n ]","",solvname)
  
  synnames = solvpg %>% html_nodes(".synonym strong") %>% html_text()
  if(length(synnames) > 0){
    synnames = gsub("[\t\n]","",synnames)
    synnames2 = str_trim(strsplit(synnames,",")[[1]])
  }
  
  casnum = solvpg %>% html_nodes(xpath = "//ul[@class = 'clearfix']//li[contains(.,'CAS Number')]") %>% html_text()
  casnum = str_trim(gsub("CAS Number","",casnum))
  
  solvnameV[i] = solvname
  
  if(length(casnum) > 0){
    casnumV[i] = casnum
  } else {
    casnumV[i] = NA
  }
  
  if(length(synnames) > 0){
    synnamesL[[i]] = synnames2
  } else {
    synnamesL[[i]] = NA
  }
  
  
}
