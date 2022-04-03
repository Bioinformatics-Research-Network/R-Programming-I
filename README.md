# R Programming I

[![](https://img.shields.io/static/v1?label=Classroom&message=Launch&color=blue&logo=GitHub)](www.google.com)

This skill assessment will test your fundamental R programming skills. 

Suggested pre-requisites: **None**

## Background and Getting Help

To get the skills in R programming needed to complete this, check out:

The BIG workshop on R programming ([link](https://www.bigbioinformatics.org/r-for-biologists)), DataCamp's introductory R course ([link](https://learn.datacamp.com/courses/free-introduction-to-r)), and intermediate R course ([link](https://learn.datacamp.com/courses/intermediate-r)).

You can always visit Henry's office hours ([link](https://calendly.com/millerh1/30min)) and ask for help in the slack group. Don't worry if this takes a while, it's designed to be a challenge. 

## Instructions

<<<<<<< HEAD
**Premise**: You are a new bioinformatics programmer in a population genomics laboratory studying the relationship between gene mutations and cancer progression. The senior 


=======
**Premise**: You are a new bioinformatics programmer in a population genomics laboratory studying the relationship between gene mutations and cancer progression. The senior bioinformatician needs your help analyzing mutations found in the tumors of breast cancer patients. She asks you to **write an R script** which contains functions needed for the analysis. 


Your supervisor needs you to **write an R script** called `utils.R` which contains functions that will help her analyze cancer gene mutations. 

First, she will source the script using:

```R
source("utils.R")
```

This will give her access to the functions you wrote -- she will then use them to complete her analysis. In order to successfully complete this assignment, you will need to create all the following functions:

### Task 1: A Universal Gene ID Converter

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

### Task 2: SNP identification

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


### Task 3: Conversion to RNA

**Premise**: Your supervisor now needs assistance with another crucial task: converting DNA sequences to RNA. She says that this is a crucial step in testing the impact of SNPs on the resulting protein. She asks you to write a function, `transcribe()`, which takes a DNA sequence and returns the RNA sequence which would be transcribed from it.

NOTE: For additional background on the transcription of DNA to RNA, see the following resource: [Khan Acadmy](https://www.khanacademy.org/science/ap-biology/gene-expression-and-regulation/transcription-and-rna-processing/a/overview-of-transcription).

**Requirements**:
1. **Name**: Needs to be an R function called `transcribe()`
2. **Arguments**: 
  - `sequence`: The DNA sequence to be translated (`character`)
3. **Returns**: The corresponding RNA sequence as a `character`. Assume the DNA is in the 3->5 orientation (template strand) and return the resulting RNA in the 5->3 orientation. 
4. **Errors**: Should produce an error if the user attempts to supply any of the following:
  - A sequence that contains incorrect genomic bases (anything not in "A", "T", "G", or "C")
  - A non-character or empty argument
 
**Example**

Input:

```R
transcribe("AAAGTCGAGGTGTAGATCAAACCC")
```

Output:

```R
# "UUUCAGCUCCACAUCUAGUUUGGG"
```

### Task 4: Conversion to protein

**Premise**: Your supervisor now needs assistance with another crucial task: converting sequencing data to protein data. She says that this is a crucial step in testing the impact of a SNP on the resulting protein. She asks you to write a function that will convert an RNA sequence into a protein sequence. To aid you in this task, she has provided a key, `codon_translate_key.csv`, which gives the mapping between three-base codons and amino acids.

NOTE: For additional background on the conversion of RNA to protein, see the following resource: [Khan Academy](https://www.khanacademy.org/science/ap-biology/gene-expression-and-regulation/translation/a/translation-overview)

**Requirements**:
1. **Name**: Needs to be an R function called `translate()`
2. **Arguments**: 
  - `sequence`: The DNA sequence to be translated (`character`)
3. **Returns**: The corresponding protein sequence as a `character`. Stop codons should be indicated by "\*".
4. **Errors**: Should produce an error if the user attempts to supply any of the following:
  - A sequence that contains incorrect genomic bases (anything not in "A", "T", "G", or "C")
  - A non-character or empty argument
  - If the sequence contains a number of bases not divisible by 3
 
**Example**

Input:

```R
translate("UUUCAGCUCCACAUCUAGUUUGGG")
```

Output:

```R
# "FQLHI*FG"
```

### Task 5: Determine the impact of SNPs on protein sequences

**Premise**: Mutations are DNA alterations which cause a change in the resulting protein. Cancers often form as the result of deleterious mutations. Your next task will be to create a function which can identify mutations in cancer DNA sequences compared to matched normal controls. 

**Requirements**:
1. **Name**: Needs to be an R function called `findMutations()`
2. **Arguments**: 
  - `cancer`: A `character` string containing the tumor DNA sequence
  - `normal`: A `character` string containing the normal tissue DNA sequence
3. **Returns**: An `data.frame` which contains the following columns:
  - `codon_number`: gives the position of an altered codon within the input sequence
  - `cancer`: gives the cancer amino acid at that position
  - `normal`: gives the normal amino acid at that position
4. **Errors**: Should produce an error if the user attempts to supply any of the following:
  - A sequence that contains incorrect genomic bases (anything not in "A", "T", "G", or "C")
  - A `cancer` sequence which has a different length from the `normal` sequence
  - A non-character or empty argument
 
**Example**

Input:

```R
findMutations(
  cancer = "AAAGTGGAGGTGTAGATCAAACCC",
  normal = "AAAGTCGAGGTGTAGATGAAACCC"
)
```

Output:

```R
#   position cancer normal
# 1        2      H      Q
# 2        6      *      Y
```

### Task 6: Find tumor suppressor genes with nonsense mutations

**Premise**: In some cases, SNPs can lead to a premature STOP codon. This is called a "nonsense mutation", and it will result in a shorter ("truncated") version of the protein which may be non-functional. Your supervisor has hypothesized that breast cancer might be a result of nonsense mutations in tumor-suppressing genes, such as TP53 and BRCA1. To help test this hypothesis, she asks you to write a function which can identify the nonsense mutations in matched tumor and normal sequences for several genes of interest.

NOTE: For additional background on mutations, see the following resource: [Khan Academy](https://www.khanacademy.org/test-prep/mcat/biomolecules/genetic-mutations/v/the-different-types-of-mutations)


**Requirements**:
1. **Name**: Needs to be an R function called `findNonsense()`
2. **Arguments**: 
  - `sequences`: a `data.frame` containing three columns: 
    - `gene_id`: The ID of the gene (can be either Ensembl or Entrez)
    - `cancer`: The sequence of the gene in the cancer sample
    - `normal`: The sequence of the gene in the normal sample
3. **Returns**: a `data.frame` with one entry per nonsense mutation, containing the following columns:
  - `gene_id`: The gene ID originally provided by the user for this gene
  - `gene_symbol`: The symbol of the supplied gene
  - `codon_number`: gives the position of an altered codon within the input sequence
  - `cancer`: gives the cancer amino acid at that position
  - `normal`: gives the normal amino acid at that position
4. **Errors**: Should produce an error if the user attempts to supply any of the following:
  - A sequence that contains incorrect genomic bases (anything not in "A", "T", "G", or "C")
  - A non-character or empty argument
  - If either DNA sequence contains a number of bases not divisible by 3
 
**Example**

Input:

```R
sequences <- data.frame(
  gene_id = c("ENSG00000147889", 8243, 675),
  cancer = c("AAAGTGGAGGTGTAGATCAAACCC", "CATATCCTGATCGGCCTGATCGGGAGG", "AGGGCTTTTACCCAGCATTGA"),
  normal = c("AAAGTCGAGGTGTAGATGAAACCC", "CATAGCCTGATCGGCCTGAGCGGGAGG", "AGGGCTTTTACCCAGGATTGA")
)
findNonsense(sequences)
```

Output:

```R
#            gene_id symbol codon_number cancer normal
# 2  ENSG00000147889 CDKN2A            6      *      Y
# 1             8243  SMC1A            2      *      S
# 21            8243  SMC1A            7      *      S
```

>>>>>>> 7226f8c81824c398f51dd7335cb3fc01cf6940d0

