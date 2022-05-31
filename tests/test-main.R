library(testthat)

setwd("../")
source("../utils.R")

test_that("Task #1 correct", {
  
  # Positive case: works as expected
  id2s <- id_converter(ids=c(7157, "ENSG00000118007", "ENSG00000143799"))
  expect_equal(id2s, list(
    `7157` = "TP53",
    ENSG00000118007 = "STAG1",
    ENSG00000143799 = "PARP1"
  ))
  
  # Error on invalid gene IDs
  expect_error(id_converter(c("ABCD", 0)))
  
})


test_that("Task #2 correct", {
  
  # Positive case: works as expected
  snvs <- find_snvs(
    cancer = "ATGCGCTA",
    normal = "ATGCTCTT"
  )
  expect_equal(snvs, data.frame(
    position = c(5, 8),
    cancer = c("G", "A"),
    normal = c("T", "T")
  ))
  
  # Error on mismatch length
  expect_error(find_snvs(
    cancer = "ATGCGCTAAA",
    normal = "ATGCTCTT"
  ))
  
  # Error on non GCAT
  expect_error(find_snvs(
    cancer = "ATGCUUUG",
    normal = "ATGCTCTT"
  ))
  
  # Error on empty
  expect_error(find_snvs(
    cancer = "",
    normal = ""
  ))
  
  # Error on non-char
  expect_error(find_snvs(
    cancer = 1,
    normal = 0
  ))
  
})


test_that("Task #3 correct", {
  
  # Positive case: works as expected
  tx <- transcribe(sequence = "AAAGTCGAGGTGTAGATCAAACCC")
  expect_equal(tx, "UUUCAGCUCCACAUCUAGUUUGGG")
  
  # Error on non GCAT
  expect_error(transcribe(sequence = "ATGCUU"))
  
  # Error on empty
  expect_error(transcribe(sequence = ""))
  
  # Error on non-char
  expect_error(transcribe(sequence = 1))
  
})


test_that("Task #4 correct", {
  
  # Positive case: works as expected
  prot <- translate(sequence = "UUUCAGCUCCACAUCUAGUUUGGG")
  expect_equal(prot, "FQLHI*FG")
  
  # Error on non GCAU
  expect_error(translate(sequence = "ATGCUU"))
  
  # Error on seq len not divisible by 3
  expect_error(transcribe(sequence = "AUGCC"))
  
  # Error on empty
  expect_error(transcribe(sequence = ""))
  
  # Error on non-char
  expect_error(transcribe(sequence = 1))
  
})


test_that("Task #5 correct", {
  
  # Positive case: works as expected
  prot_var <- protein_variant(
    cancer = "AAAGTGGAGGTGTAGATCAAACCC",
    normal = "AAAGTCGAGGTGTAGATGAAACCC"
  )
  expect_equal(prot_var, data.frame(
    codon_number = c(2, 6),
    cancer = c("H", "*"),
    normal = c("Q", "Y")
  ))
  
  # Error on mismatch length
  expect_error(protein_variant(
    cancer = "ATGCGCTAA",
    normal = "ATGCTCTTACCC"
  ))
  
  # Error on seq len not divisible by 3
  expect_error(protein_variant(
    cancer = "ATGCCCCGGG",
    normal = "ATGCTCTTGG"
  ))
  
  # Error on non GCAT
  expect_error(protein_variant(
    cancer = "ATGCUUUGG",
    normal = "ATGCTCTTG"
  ))
  
  # Error on empty
  expect_error(protein_variant(
    cancer = "",
    normal = ""
  ))
  
  # Error on non-char
  expect_error(protein_variant(
    cancer = 1,
    normal = 0
  ))
  
})


test_that("Task #6 correct", {
  
  # Positive case: works as expected
  sequences <- data.frame(
    gene_id = c("ENSG00000147889", 8243, 675),
    cancer = c(
      "AAAGTGGAGGTGTAGATCAAACCC", 
      "CATATCCTGATCGGCCTGATCGGGAGG", 
      "AGGGCTTTTACCCAGCATTGA"
    ),
    normal = c(
      "AAAGTCGAGGTGTAGATGAAACCC", 
      "CATAGCCTGATCGGCCTGAGCGGGAGG", 
      "AGGGCTTTTACCCAGGATTGA"
    )
  )
  nons <- find_nonsense(sequences = sequences)
  rownames(nons) <- NULL
  expect_equal(
    nons, data.frame(
      gene_id = c("ENSG00000147889", "8243", "8243"),
      symbol = c("CDKN2A", "SMC1A", "SMC1A"),
      codon_number = c(6, 2, 7),
      cancer = c("*", "*", "*"),
      normal = c("Y", "S", "S")
    )
  )
  
  # Error on mismatch length
  sequences <- data.frame(
    gene_id = "ENSG00000147889",
    cancer = "AAAGTGGAGGTGTAGATCAAA",
    normal = "AAAGTCGAGGTGTAGATGAAACCC"
  )
  expect_error(find_nonsense(sequences))
  
  # Error on seq len not divisible by 3
  sequences <- data.frame(
    gene_id = "ENSG00000147889",
    cancer = "AAAGTGGAGGTGTAGATCAAACCCT",
    normal = "AAAGTCGAGGTGTAGATGAAACCCT"
  )
  expect_error(find_nonsense(sequences))
  
  # Error on non GCAT
  sequences <- data.frame(
    gene_id = "ENSG00000147889",
    cancer = "AAAGTGGAGGTGTAUATCAAACCC",
    normal = "AAAGTCGAGGTGTAGATGAAACCC"
  )
  expect_error(find_nonsense(sequences))
  
  # Error on empty
  sequences <- data.frame(
    gene_id = "ENSG00000147889",
    cancer = "",
    normal = ""
  )
  expect_error(find_nonsense(sequences))
  
  # Error on non-char
  sequences <- data.frame(
    gene_id = "ENSG00000147889",
    cancer = 1,
    normal = 0
  )
  expect_error(find_nonsense(sequences))
  
})



