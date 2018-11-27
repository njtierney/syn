
<!-- README.md is generated from README.Rmd. Please edit that file -->

# syn

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

Wow\! There are 618 synonyms for cool. That’s…contumelious, I guess.

You can also provide it a number of words to return with the `n_words`
argument, which will randomly select the number of words given

``` r
syn("awesome", 1)
#> [1] "aggrandized"
syn("awesome", 2)
#> [1] "deified"     "untouchable"
syn("awesome", 5)
#> [1] "elevated" "fell"     "sainted"  "mighty"   "horrid"
```

## Example: Creating a sentence

OK cool, let’s use these in a sentence, using the `glue` package. Which
of these better?

``` r

glue::glue("This is really cool!")
#> This is really cool!
glue::glue("This is really {syn('cool', 1)}!")
#> This is really suppressed!
glue::glue("This is really {syn('cool', 10)}!")
#> This is really imperturbation!
#> This is really resting!
#> This is really passionless!
#> This is really rational!
#> This is really stolid!
#> This is really fab!
#> This is really autistic!
#> This is really bridle!
#> This is really sane!
#> This is really undumbfounded!
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
#>  [1] "up to"          "most assuredly" "minimal"        "kind"          
#>  [5] "resourceful"    "principled"     "superior"       "enjoyable"     
#>  [9] "tenderhearted"  "grateful"      
#> 
#> $evil
#>  [1] "heinous"        "trying"         "iniquity"       "unskillful"    
#>  [5] "unvirtuousness" "heavy sin"      "nefariousness"  "dire"          
#>  [9] "infelicitous"   "dreadful"
```

## Future Work

In the future we will provide a similar set of functions for anyonyms:
`ant` and `ants`.

## Code of Conduct

Please note that the ‘syn’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms.
