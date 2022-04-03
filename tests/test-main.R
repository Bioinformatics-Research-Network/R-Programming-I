library(testthat)

setwd("../")
source("utils.R")

test_that("Task #1 correct", {
  
  id2s <- id2Symbol(ids=c(7157, "ENSG00000118007", "ENSG00000143799"))
  
  expect_equal(id2s, list(
    `7157` = "TP53",
    ENSG00000118007 = "STAG1",
    ENSG00000143799 = "PARP1"
  ))
  
  expect_error(id2Symbol(c("ABCD", 0)))
  
})




