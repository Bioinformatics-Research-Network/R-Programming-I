# R Programming I

<!---
Update the badge below as the version changes
-->

[![](https://img.shields.io/static/v1?label=Classroom&message=Launch&color=blue&logo=GitHub)](https://classroom.github.com/a/cES7R_Dy)
![](https://img.shields.io/static/v1?label=Version&message=0.0.1a&color=brown)

**Purpose**: This skill assessment will test your fundamental R programming skills. 

**Pre-requisites**: None

## Background

To complete this skill assessment, you will need to launch it in GitHub classroom by clicking the badge above or following [this link](https://classroom.github.com/a/cES7R_Dy). For further information on how to complete BRN skill assessments, visit our tutorial [here](www.google.com).


### Useful details

1. Your code must not depend on any packages outside of base R v4.1.2
2. To test your code locally, run `testthat::test_dir("tests/")`
    - Make sure to address any failed tests before proceeding.
3. To lint your code locally, run `lintr::lint('utils.R')`
    - Make sure to address any lint notes/warnings before proceeding.
    - To style your code automatically, run `styler::style_file("utils.R")`
4. Once you are ready for automated review, push your changes to GitHub and issue the `@bot check` command on the "Feedback" pull request in your repo.
5. If you pass automated checks, you will be able to issue the `@bot review` command to trigger the manual review process.


### Rules

BRN has several rules which trainees should follow at all times. Failure to comply with these rules may result in disciplinary action.

1. At all times, abide by the [BRN code of conduct](https://docs.google.com/document/d/1q06RJbIsyIzLC828A7rBEhtfkujkj9kx7Y118AaWASA/edit?usp=sharing).
2. **Do not share your code/answers** from this or any other BRN skill assessment.
3. **Do not plagiarize code/answers**. Copying and pasting from stack overflow is fine; copying skill assessment answers from another trainee is not fine.


### Getting help

To get the skills in R programming needed to complete this, check out:

The BIG workshop on R programming ([link](https://www.bigbioinformatics.org/r-for-biologists)), DataCamp's introductory R course ([link](https://learn.datacamp.com/courses/free-introduction-to-r)), and intermediate R course ([link](https://learn.datacamp.com/courses/intermediate-r)).

You can always visit Henry's office hours ([link](https://calendly.com/millerh1/30min)) and ask for help in the BRN slack group on the \#help channel. Don't worry if this takes a while, it's designed to be a challenge. 

## Skill assessment instructions

**Premise**: You are a new bioinformatics programmer in a population genomics laboratory studying the relationship between gene mutations and cancer progression. The senior bioinformatician needs your help analyzing mutations found in the tumors of breast cancer patients. She asks you to **write an R script** named `utils.R` which contains functions needed for the analysis. 

In order to successfully complete this assignment, you will need to complete all the following tasks.

### Task 1: A Universal Gene ID Converter

**Premise**: While we often refer to genes by their "symbols" (e.g., TP53, BRCA1), these symbols can change over time. To ensure consistency, bioinformaticians often use "Gene IDs", and then they convert IDs to gene symbols for presentation/visualization purposes. Your supervisor has aggregated genomic data from multiple different databases with two different types of gene IDs: (1) Ensemble gene IDs (E.g., [ENSG00000147889](http://useast.ensembl.org/Homo_sapiens/Gene/Summary?g=ENSG00000147889;r=9:21967752-21995301)) and (2) Entrez gene IDs (E.g., [8243](https://www.ncbi.nlm.nih.gov/gene/8243)). She needs you to write a function that accepts multiple gene IDs and converts them to gene symbols. Fortunately, your supervisor has provided you with a CSV file (`gene_id_to_symbol.csv`) that contains the mapping between IDs of various types and gene symbols.
 
**Requirements**:

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

**Requirements**:

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

NOTE: For additional background on the transcription of DNA to RNA, see the following resource: [Khan Acadmy](https://www.khanacademy.org/science/ap-biology/gene-expression-and-regulation/transcription-and-rna-processing/a/overview-of-transcription).

**Requirements**:

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

NOTE: For additional background on the conversion of RNA to protein (translation), see the following resource: [Khan Academy](https://www.khanacademy.org/science/ap-biology/gene-expression-and-regulation/translation/a/translation-overview)

**Requirements**:

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

**Requirements**:

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

NOTE: For additional background on mutations, see the following resource: [Khan Academy](https://www.khanacademy.org/test-prep/mcat/biomolecules/genetic-mutations/v/the-different-types-of-mutations)

**Requirements**:

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
