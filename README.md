# R Programming I

[![](https://img.shields.io/static/v1?label=Classroom&message=Launch&color=blue&logo=GitHub)](www.google.com)

This skill assessment will test your fundamental R programming skills. 

Suggested pre-requisites: **None**

## Background and Getting Help

To get the skills in R programming needed to complete this, check out:

The BIG workshop on R programming ([link](https://www.bigbioinformatics.org/r-for-biologists)), DataCamp's introductory R course ([link](https://learn.datacamp.com/courses/free-introduction-to-r)), and intermediate R course ([link](https://learn.datacamp.com/courses/intermediate-r)).

You can always visit Henry's office hours ([link](https://calendly.com/millerh1/30min)) and ask for help in the slack group. Don't worry if this takes a while, it's designed to be a challenge. 

## Instructions

**Premise**: You are a new bioinformatics programmer in a population genomics laboratory studying the relationship between gene mutations and cancer progression. The senior bioinformatician needs your help analyzing mutations found in the tumors of breast cancer patients. She asks you to **write an R script** which contains functions needed for the analysis. 

### Tasks

Your supervisor needs you to **write an R script** called `utils.R` which contains functions that will help her analyze cancer gene mutations. 

First, she will source the script using:

```R
source("utils.R")
```

This will give her access to the functions you wrote -- she will then use them to complete her analysis. In order to successfully complete this assignment, you will need to create all the following functions:

#### Task 1: A Universal Gene ID Converter

**Premise**: While we often refer to genes by their "symbols" (e.g., TP53, BRCA1), these symbols can change over time based on the decisions of the [HGNC](https://www.genenames.org/). To ensure consistency, we usually perform most analyses using "Gene IDs" and then convert to symbols for presentation/visualization purposes. In this instance, your supervisor has aggregated genomic data from multiple different databases, so there are two different types of gene IDs she needs to convert to symbols: (1) Ensemble gene IDs (E.g., [ENSG00000147889](http://useast.ensembl.org/Homo_sapiens/Gene/Summary?g=ENSG00000147889;r=9:21967752-21995301)) and (2) Entrez gene IDs (E.g., [8243](https://www.ncbi.nlm.nih.gov/gene/8243)). She needs you to write a function that accepts multiple gene IDs and converts them to symbols.

Fortunately, your supervisor has provided you with a CSV file (`id2symbol.csv`) that contains the mapping between IDs of various types and gene symbols.
 
**Requirements**:
1. **Name**: Needs to be an R function called `id2Symbol()`
2. **Arguments**: 
  - `ids`: A vector containing gene IDs (`char`)
3. **Returns**: Needs to return a `list` where the list element names are the input IDs and each element contains a character vector with the corresponding gene symbol(s).
4. **Errors**: Should produce an error if the user attempts to supply an invalid ID. 

Here is an example input:

```R
id2Symbol(ids=c("ENSG00000147889", 8243))
```

Corresponding output:

```R
# $ENSG00000147889
# [1] "CDKN2A"
# 
# $`8243`
# [1] "SMC1A"
```

#### Task 2: SNP identification

**Premise**: Your supervisor wants to identify [single nucleotide polymorphisms (SNPs)](https://www.genome.gov/genetics-glossary/Single-Nucleotide-Polymorphisms.) in a tumor genome compared to a matched control sample from the same patient. She needs you to write a function that take two DNA sequences and identify the places in which the bases are altered.

**Requirements**:
1. **Name**: Needs to be an R function called `findSNPs()`
2. **Arguments**: 
  - `cancer`: A `character` string containing the tumor DNA sequence
  - `normal`: A `character` string containing the normal tissue DNA sequence
3. **Returns**: An `data.frame` which contains the following columns:
  - `position`: gives the position of an alteration within the input sequence
  - `cancer`: gives the cancer base at that position
  - `normal`: gives the normal base at that position
4. **Errors**: Should produce an error if the user attempts to supply any of the following:
  - A sequence that contains incorrect genomic bases (anything not in "A", "T", "G", or "C")
  - A `cancer` sequence which has a different length from the `normal` sequence
  - A non-character or empty argument
 
**Example**

Input:

```R
findSNPs(
  cancer = "ATGCGCTA",
  normal = "ATGCTCTT"
)
```

Output:

```R
#   position cancer normal
# 1        5      G      T
# 2        8      A      T
```


#### Task 3: 

**Premise**: Your supervisor now needs assistance with another crucial task: converting sequencing data to protein data. She says that this is a crucial step in testing the impact of a SNP on the resulting protein. She asks you to write a function that will convert a DNA sequence into a protein sequence. 

NOTE: For additional background on the conversion of DNA to protein, see the following resource:







