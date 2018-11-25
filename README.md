<!-- README.md is generated from README.Rmd. Please edit that file -->
syn
===

The goal of syn is to provide two main functions:

-   `syn` - generate synonyms
-   `ant` - generate antonyms (not done yet).

That is it.

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(syn)

## basic example code
synonyms <- syn("cool") 

# which is better? 
paste0("This is really cool!") 
#> [1] "This is really cool!"
# OR 
paste0("This is really ", synonyms[1:10], "!")
#>  [1] "This is really abate!"          "This is really abnegation!"    
#>  [3] "This is really above all that!" "This is really absolute zero!" 
#>  [5] "This is really abstinence!"     "This is really ace-high!"      
#>  [7] "This is really affectless!"     "This is really aguey!"         
#>  [9] "This is really aguish!"         "This is really air-condition!"
```

It is also possible to obtain the synonyms for multiple words in one go
and select a random sample.

``` r
syns(c("good", "evil"), 10)
#> $good
#>  [1] "morality"      "succulent"     "yes indeedy"   "humane"       
#>  [5] "righteousness" "omniscient"    "wonderful"     "fab"          
#>  [9] "uncolored"     "defensible"   
#> 
#> $evil
#>  [1] "ghastly"      "reprobacy"    "aberrant"     "bodeful"     
#>  [5] "traitorous"   "foul"         "dirty"        "heinousness" 
#>  [9] "unprincipled" "diabolism"
```
