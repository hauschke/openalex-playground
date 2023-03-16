install.packages("remotes", "dplyr", "knitr", "bibliometrix")
remotes::install_github("massimoaria/openalexR")

library(openalexR)
library(dplyr)s
library(knitr)
library(bibliometrix)
library(shiny)

raw <- oa_fetch(
  identifier = NULL,
  entity = "works",
  institutions.country_code = c("de"),  
  institutions.country_code = c("ua"),  
  from_publication_date = "1991-08-24",
  search = NULL,
  endpoint = "https://api.openalex.org/",
  count_only = FALSE,
  verbose = TRUE
)


results <- biblioAnalysis(bibmet, sep = ";")
S <- summary(object = results, k = 10, pause = FALSE)
plot(x = results, k = 10, pause = FALSE)

M <- metaTagExtraction(bibmet, Field = "AU_CO", sep = ";")

NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "references", sep = ";")

networkPlot(NetMatrix, n = dim(NetMatrix)[1], Title = "Country Collaboration", type = "cir-
cle", size=TRUE, remove.multiple=FALSE,labelsize=0.8)

