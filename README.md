# R Programming I <img src="https://api.badgr.io/public/badges/v0CU877hR5qI8OtDN7EYTg/image" align="right" alt="logo" width="240" style = "border: none; float: right;">

[![](https://img.shields.io/static/v1?label=Language&message=R&color=%23276DC2)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)
[![](https://img.shields.io/static/v1?label=Type&message=Software&color=darkgoldenrod)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)
[![](https://img.shields.io/static/v1?label=Version&message=0.0.2a&color=purple)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)
[![](https://img.shields.io/static/v1?label=Lifecycle&message=experimental&color=red)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)

**Purpose**: To test your fundamental R programming skills. 

**Pre-requisites**: None

# Instructions

The following instructions describe the [requirements](#requirements) to complete this task and earn the R Programming I badge 🏆. They also provide [guidance](#guidance) to help you along the way. 

A few things to keep in mind:

1. Please remember at all times to abide by the [BRN Code of Conduct](https://docs.google.com/document/d/1q06RJbIsyIzLC828A7rBEhtfkujkj9kx7Y118AaWASA/edit?usp=sharing) and [Academic Honesty Policy](https://docs.google.com/document/d/1-Xoko7VDr0lK7olboGQ2CPmEnUTV3WmiDxwQQuGBgiQ/edit). If you notice violations of these policies, please contact codeofconduct@bioresnet.org. 
2. Please remember to [reach out](#getting-help) if you get stuck, find bugs, or even just have a question!

Good luck and have fun! 😊

~ BRN Bot 🤖

## Requirements

**Badge Requirements**:

[![](https://img.shields.io/static/v1?label=Tests&message=Required&color=lightsalmon)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)
[![](https://img.shields.io/static/v1?label=Linting&message=Required&color=lightsalmon)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)
[![](https://img.shields.io/static/v1?label=Coverage&message=Not%20required&color=whitesmoke)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)
[![](https://img.shields.io/static/v1?label=Review&message=Not%20required&color=whitesmoke)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)


**Testing environment**:

[![](https://img.shields.io/static/v1?label=Runs%20on&message=Ubuntu%2022.04%20LTS&color=%235e2750)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)
[![](https://img.shields.io/static/v1?label=R-Version&message=4.2.0&color=cornflowerblue)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)
[![](https://img.shields.io/static/v1?label=Packages-allowed&message=None&color=lightgray)](https://brnteam.notion.site/e8c045b812d842f8bca8e339d22c38ad?v=6245e8becaa641bcafd276e5d910e402)


**Assessment Premise**: 

You are a new bioinformatics programmer 🤓 in the Genomics Division @ BioResLabs INC 🏢. Your role is to study the link between mutations and cancer 🧬. The senior bioinformatician needs your help analyzing mutations in breast cancer tumors 💻. She asks you to **write an R script** called `utils.R` which contains functions needed for the analysis.

_The following **tasks** describe the **functions** that should be included in `utils.R`._

### Task 1: A Universal Gene ID Converter

<details>
<summary>Premise</summary>

<hr>

While we often refer to genes by their "symbols" (e.g., TP53, BRCA1), these symbols can change over time. To ensure consistency, bioinformaticians often use "Gene IDs", and then they convert IDs to gene symbols for presentation/visualization purposes. Your supervisor has aggregated genomic data from multiple different databases with two different types of gene IDs: (1) Ensemble gene IDs (E.g., [ENSG00000147889](http://useast.ensembl.org/Homo_sapiens/Gene/Summary?g=ENSG00000147889;r=9:21967752-21995301)) and (2) Entrez gene IDs (E.g., [8243](https://www.ncbi.nlm.nih.gov/gene/8243)). 
She needs you to write a function that accepts multiple gene IDs and converts them to gene symbols. Fortunately, your supervisor has provided you with a CSV file (`gene_id_to_symbol.csv`) that contains the mapping between IDs of various types and gene symbols.

<hr>

</details>
 
**Specific Requirements**:

1. **Name**: Needs to be an R function called `id_converter()`
2. **Arguments**: 
    - `ids`: A vector containing gene IDs.
3. **Returns**: A `list` object. The list element names are the input IDs and each element contains a character vector with the corresponding gene symbol(s).
4. **Errors**: Should produce an error if the user attempts to supply an invalid gene ID. 

<details>
<summary>Examples</summary>

**Example 1**

Usage:

```R
id_converter(ids=c("ENSG00000147889", 8243))
```

Corresponding output:

```R
# $ENSG00000147889
# [1] "CDKN2A"
# 
# $`8243`
# [1] "SMC1A"
```


**Example 2**

Usage:

```R
id_converter(ids=c("NOT-A-VALID-ID"))
```

Output (error message may vary):

```R
# Error: Input contains invalid gene IDs: "NOT-A-VALID-ID"
```

</details>


### Task 2: Variant identification

**Premise**: The senior bioinformatician has hypothesized that [single nucleotide variants (SNVs)](https://www.cancer.gov/publications/dictionaries/genetics-dictionary/def/single-nucleotide-variant) in [tumor-suppressor genes](https://www.genome.gov/genetics-glossary/Tumor-Suppressor-Gene) may cause breast cancer to develop. To test this theory, she has mined multiple databases to obtain genome sequences of matched tumor and normal tissue samples. She has now tasked you with writing a function that will identify SNVs in the breast tumors compared to the healthy control tissue. To do this, you will need to write a function (`find_snvs()`) that takes two sequences (one 'cancer' and one 'normal') and identifies the positions in which the sequence is altered.

**Specific Requirements**:

1. **Name**: Needs to be an R function called `find_snvs()`
2. **Arguments**: 
    - `cancer`: A `character` string containing the tumor DNA sequence
    - `normal`: A `character` string containing the normal tissue DNA sequence
3. **Returns**: A `data.frame` which contains the following columns:
    - `position`: gives the position of an alteration within the input sequence
    - `cancer`: gives the cancer base at that position
    - `normal`: gives the normal base at that position
4. **Errors**: Should produce an error if the user attempts to supply any of the following:
    - A sequence that contains incorrect genomic bases (anything not in "A", "T", "G", or "C")
    - A `cancer` sequence which has a different length from the `normal` sequence
    - A non-character or empty argument
 
<details>
<summary>Examples</summary>
 

**Example 1**

Input:

```R
find_snvs(
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

**Example 2**

Input:

```R
find_snvs(
  cancer = "ATGCGCTATGCACTG",
  normal = "ATGCTCTT"
)
```

Output (error text may vary):

```R
# Error: Sequences should be the same length.
```

</details>


### Task 3: Conversion to RNA (transcription)

**Premise**: Your supervisor now needs assistance with another crucial task: converting DNA sequences to RNA. She explains that this is a crucial step in eventually testing the impact of SNVs on protein sequences. She asks you to write a function, `transcribe()`, which takes a  DNA sequence and returns the RNA sequence that would be transcribed from it.

**Specific Requirements**:

1. **Name**: Needs to be an R function called `transcribe()`
2. **Arguments**: 
    - `sequence`: The DNA sequence to be translated.
3. **Returns**: The corresponding RNA sequence. Assume the input DNA sequence is in the 3->5 orientation (template strand) and return the resulting RNA in the 5->3 orientation. 
4. **Errors**: Should produce an error if the user attempts to supply any of the following:
    - A sequence that contains incorrect genomic bases (anything not in "A", "T", "G", or "C")
    - A non-character or empty argument

<details>
<summary>Examples</summary>

**Example 1**

Input:

```R
transcribe("AAAGTCGAGGTGTAGATCAAACCC")
```

Output:

```R
# "UUUCAGCUCCACAUCUAGUUUGGG"
```

**Example 2**

Input:

```R
transcribe("AAAGT___CGAGGTGTAGATCAAACCC")
```

Output (error text may vary):

```R
# Error: Invalid bases provided: "_" - should be one of "A", "T", "G", "C" 
```

</details>

### Task 4: Conversion to protein (translation)

**Premise**: Your supervisor now needs your help converting the RNA sequences to protein sequences. To aid you in this task, she has provided a key, `codon_translate_key.csv`, which gives the mapping between three-base RNA codons and the amino acids of the resulting protein.

**Specific Requirements**:

1. **Name**: Needs to be an R function called `translate()`
2. **Arguments**: 
    - `sequence`: The RNA sequence to be translated (assume 5->3 orientation).
3. **Returns**: The corresponding protein sequence. Stop codons should be indicated by "\*".
4. **Errors**: Should produce an error if the user attempts to supply any of the following:
    - A sequence that contains incorrect genomic bases (anything not in "A", "U", "G", or "C")
    - A non-character or empty argument
    - A sequence in which the number of bases is not evenly divisible by 3

<details>
<summary>Examples</summary>

**Example 1**

Input:

```R
translate("UUUCAGCUCCACAUCUAGUUUGGG")
```

Output:

```R
# "FQLHI*FG"
```

**Example 2**

Input:

```R
translate("UUAG")
```

Output (error text may vary):

```R
# Error: Input sequence not evenly divisible by 3.
```

</details>


### Task 5: Determine the impact of SNVs on protein sequences

**Premise**: Thus far, you have built functions to identify variants and convert between DNA, RNA, and protein -- good work! Now you are ready to help your supervisor start testing her hypothesis. She asks you to build a new function, `protein_variant()`, which can identify SNVs in cancer samples which result in an altered protein sequence.

**Specific Requirements**:

1. **Name**: Needs to be an R function called `protein_variant()`
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

<details>
<summary>Examples</summary>

**Example 1**

Input:

```R
protein_variant(
  cancer = "AAAGTGGAGGTGTAGATCAAACCC",
  normal = "AAAGTCGAGGTGTAGATGAAACCC"
)
```

Output:

```R
#   codon_number cancer normal
# 1            2      H      Q
# 2            6      *      Y
```


**Example 2**

Input:

```R
protein_variant(
  cancer = "AAAGTGGAGGTG",
  normal = "AAAGTCGAGGTGTAGATGAAACCC"
)
```

Output (error text may vary):

```R
# Error: Sequences should be the same length.
```

</details>


### Task 6: Find tumor suppressor genes with nonsense mutations

**Premise**: In some cases, SNVs can lead to a premature STOP codon. This is called a ["nonsense mutation"](https://www.genome.gov/genetics-glossary/Nonsense-Mutation), and it will result in a shorter ("truncated") version of the protein which may be non-functional. Your supervisor has hypothesized that breast cancer might be a result of nonsense mutations in tumor-suppressing genes, such as [TP53](https://www.genecards.org/cgi-bin/carddisp.pl?gene=TP53) and [BRCA1](https://www.genecards.org/cgi-bin/carddisp.pl?gene=BRCA1). To help test this hypothesis, she asks you to write a function which can identify the nonsense mutations in matched tumor and normal sequences across several genes of interest.

**Specific Requirements**:

1. **Name**: Needs to be an R function called `find_nonsense()`
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
    - If any supplied DNA sequence contains a number of bases not divisible by 3
 
<details>
<summary>Examples</summary>
 
**Example 1**

Input:

```R
sequences <- data.frame(
  gene_id = c("ENSG00000147889", 8243, 675),
  cancer = c("AAAGTGGAGGTGTAGATCAAACCC", "CATATCCTGATCGGCCTGATCGGGAGG", "AGGGCTTTTACCCAGCATTGA"),
  normal = c("AAAGTCGAGGTGTAGATGAAACCC", "CATAGCCTGATCGGCCTGAGCGGGAGG", "AGGGCTTTTACCCAGGATTGA")
)
find_nonsense(sequences)
```

Output:

```R
#            gene_id symbol codon_number cancer normal
# 2  ENSG00000147889 CDKN2A            6      *      Y
# 1             8243  SMC1A            2      *      S
# 21            8243  SMC1A            7      *      S
```

**Example 2**

Input:

```R
sequences <- data.frame(
  gene_id = c("ENSG00000147889", 8243, "NOT-A-GENE"),
  cancer = c("AAAGTGGAGGTGTAGATCAAACCC", "CATATCCTGATCGGCCTGATCGGGAGG", "AGGGCTTTTACCCAGCATTGA"),
  normal = c("AAAGTCGAGGTGTAGATGAAACCC", "CATAGCCTGATCGGCCTGAGCGGGAGG", "AGGGCTTTTACCCAGGATTGA")
)
find_nonsense(sequences)
```

Output (error text may vary):

```R
# Error: "NOT-A-GENE" is not a valid gene.
```

</details>

<br>


## Guidance


### Useful details

1. Your code must not depend on any packages outside of base R v4.2.0
2. To test your code locally, run `testthat::test_dir("tests/")`
3. To lint your code locally, run `lintr::lint('utils.R')`
4. If you are feeling uncomfortable working with the BRN Skill Assessment platform, please consider going back to the R-based tutorial and completing it. If you are still getting stuck, please check the [Getting help](#getting-help) section.


### Errors

This skill assessment introduces the concept of expected errors. For example, in [Task \#1](#task-1-a-universal-gene-id-converter), the function `id_converter()` should produce an error if an invalid gene ID is supplied. 

There are several R programming patterns which can be used for handling errors. Here are two that I commonly use:

1. `if...stop()` - stop and provide a useful error message to the user when a condition is met.

```R
if (! argument %in% valid_arguments) {
    stop(paste0("You supplied an invalid argument: ", argument))
}
```

2. `stopifnot()` - stop when a condition is _not_ met (error message is not as user-friendly)

```R
stopifnot(argument %in% valid_arguments)
```


### Linting

This skill assessment requires that your code passes the automated tests AND also passes "linting". Linting is an automated check to ensure that your code does not contain syntax errors, and it ensures your code follows good stylistic practices. 

In R, we typically use the `lintr` package to lint our code. The automated checks will do this when you run `@brnbot check`. However, you can also lint your code locally by installing `lintr` and linting your code:

```R
# Install lintr
install.packages("lintr")

# Lint your code
lintr::lint('utils.R')
```

You will need to address **all** warnings, errors, and notes before your code will pass the checks. 

**Protip**: Rather than manually restyling your code to pass linting, you can use the `styler` R package to automate most of the restyling process.

```R
# Install styler
install.packages("styler")

# Style code
styler::style_file("utils.R")
```


### Learning resources

#### R Programming

For a tutorial on how to use **git and GitHub**, check out these resources:
1. Written tutorials: [GitHub official tutorial](https://docs.github.com/en/get-started/quickstart), [freecodecamp.org](https://www.freecodecamp.org/news/git-and-github-for-beginners/), [analyticsvidhya](https://www.analyticsvidhya.com/blog/2021/09/git-and-github-tutorial-for-beginners/)
2. YouTube tutorials: [Tech with Tim](https://www.youtube.com/watch?v=DVRQoVRzMIY), [freecodecamp.org](https://www.youtube.com/watch?v=RGOj5yH7evk), [Amigoscode](https://www.youtube.com/watch?v=3fUbBnN_H2c)


For basic **R programming**, check out these resources:

1. Written tutorials: [Introduction to R (book)](https://intro2r.com/), [Hands-On Programming with R (book)](https://rstudio-education.github.io/hopr/), [W3 schools](https://www.w3schools.com/r/)
2. YouTube tutorials: [Simplilearn](https://www.youtube.com/watch?v=7NLPPFU0O3w), [Algovibes](https://www.youtube.com/watch?v=fpl_ny-jX5Y), [BIG Bioinformatics](https://www.bigbioinformatics.org/r-for-premat)
3. MOOCs: [EdX](https://www.edx.org/course/data-science-r-basics), [Coursera](https://www.coursera.org/learn/r-programming)
4. Online learning platforms: [DataCamp](https://app.datacamp.com/learn/courses/free-introduction-to-r), [dataquest](https://app.dataquest.io/c/90/m/499/introduction-to-programming-in-r), [codecademy](https://www.codecademy.com/learn/learn-r)


For learning how to use **`testthat`**, check out these resources:

1. Written: [Official testthat docs](https://testthat.r-lib.org/), [R-bloggers](https://www.r-bloggers.com/2019/11/automated-testing-with-testthat-in-practice/)
2. YouTube: [InfoWorld](https://www.youtube.com/watch?v=bx92oCMxUhg)


For learning how to use **`lintr`** and **`styler`**, check out these resources:
1. Written: [Official lintr docs](https://lintr.r-lib.org/), [Official styler docs](https://styler.r-lib.org/)


#### Biological background

This skill assessment (and those which follow it) assumes U.S. college-level biology knowledge. If you are feeling uncomfortable with topics like transcription and mutations, it is **highly encouraged** for you to develop your fundamental biology knowledge before continuing. 

Here are some excellent free learning resources:

1. Khan Academy College Biology Series: [link](https://www.khanacademy.org/science/ap-biology)
2. Khan Academy MCAT (U.S. medical school entry exam) series, selected modules: [Molecular Biology](https://www.khanacademy.org/test-prep/mcat/biomolecules), [Cell Biology](https://www.khanacademy.org/test-prep/mcat/cells), [Anatomy & Physiology](https://www.khanacademy.org/test-prep/mcat/organ-systems)
3. EdX Introduction to Biology: [link](https://www.edx.org/course/introduction-to-biology-the-secret-of-life-3)
4. EdX Molecular Biology: [link](https://www.edx.org/course/molecular-biology-part-1-dna-replication-and-repair)


### Getting help

If you find a bug or get confused, please don't hesitate to contact the BRN Skill Assessment maintainers on the **#skill-assessment-help** Slack channel, and they will assist you. 
