
<!-- README.md is generated from README.Rmd. Please edit that file -->

# syn <img src="man/figures/logo.png" align="right" height=140/>

[![Travis build
status](https://travis-ci.org/ropenscilabs/syn.svg?branch=master)](https://travis-ci.org/ropenscilabs/syn)[![AppVeyor
build
status](https://ci.appveyor.com/api/projects/status/github/ropenscilabs/syn?branch=master&svg=true)](https://ci.appveyor.com/project/ropenscilabs/syn)[![Coverage
status](https://codecov.io/gh/ropenscilabs/syn/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/syn?branch=master)

`syn` is a **zero dependency** R package that lists synonyms.

## Example: Synonyms for “cool”

The `syn` function returns all synonyms for a given word:

Let’s look at synonyms for “cool”:

``` r
library(syn)

syn_cool <- syn("cool")

head(syn_cool)
#> [1] "abate"          "abnegation"     "above all that" "absolute zero" 
#> [5] "abstinence"     "ace-high"
tail(syn_cool)
#> [1] "withhold"       "without nerves" "wizard"         "wonderless"    
#> [5] "wonderlessness" "zealless"
```

Wow, there are a lot\! How many are there?

``` r
length(syn_cool)
#> [1] 618
```

Wow\! There are 618 synonyms for cool. That’s…quiet mind, I guess.

You can also provide it a number of words to return with the `n_words`
argument, which will randomly select the number of words given

``` r
syn("awesome", 1)
#> [1] "untouchable"
syn("awesome", 2)
#> [1] "mysterious" "incredible"
syn("awesome", 5)
#> [1] "overwhelming"  "enormous"      "imposing"      "massy"        
#> [5] "awe-inspiring"
```

## Example: Creating a sentence

OK cool, let’s use these in a sentence, using the `glue` package. Which
of these better?

``` r

glue::glue("This is really cool!")
#> This is really cool!
glue::glue("This is really {syn('cool', 1)}!")
#> This is really resting!
glue::glue("This is really {syn('cool', 10)}!")
#> This is really crispness!
#> This is really unloving!
#> This is really inimical!
#> This is really frigidity!
#> This is really out of touch!
#> This is really meden agan!
#> This is really unexpansive!
#> This is really heartless!
#> This is really toning!
#> This is really retrench!
```

## Using multiple words with `syns`

You can generate synonyms for multiple words with the `syns` function.
This takes a vector of words, returning a named list

``` r
syns_good_evil <- syns(c("good", "evil"))
str(syns_good_evil)
#> List of 2
#>  $ good: chr [1:667] "able to pay" "absolutely" "acceptable" "accomplished" ...
#>  $ evil: chr [1:365] "aberrant" "abnormal" "abominable" "abomination" ...
```

You can also provide `n_words` for `syns`, and it will return a random
selection of the words of that number.

``` r
syns(c("good", "evil"),
     n_words =  10)
#> $good
#>  [1] "welcome"       "omniscient"    "allowable"     "agreeable"    
#>  [5] "encomiastic"   "warranted"     "proper"        "legal"        
#>  [9] "yes sirree"    "well and good"
#> 
#> $evil
#>  [1] "genocide"               "crime against humanity"
#>  [3] "Loki"                   "ghastly"               
#>  [5] "catty"                  "threatening"           
#>  [7] "curse"                  "repulsive"             
#>  [9] "obscene"                "unpropitious"
```

## Future Work

In the future we will provide a similar set of functions for anyonyms:
`ant` and `ants`.

## Code of Conduct

Please note that the ‘syn’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms.
