<!-- README.md is generated from README.Rmd. Please edit that file -->
syn
===

The goal of syn is to provide two main functions:

-   `syn` - generate synonyms
-   `ant` - generate antonyms (needs work).

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
#>  [1] "This is really cool!"                 
#>  [2] "This is really Buddha-like composure!"
#>  [3] "This is really Laodicean!"            
#>  [4] "This is really OK!"                   
#>  [5] "This is really Olympian!"             
#>  [6] "This is really Oriental calm!"        
#>  [7] "This is really abate!"                
#>  [8] "This is really abnegation!"           
#>  [9] "This is really above all that!"       
#> [10] "This is really absolute zero!"
```
