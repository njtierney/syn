
<!-- README.md is generated from README.Rmd. Please edit that file -->

# syn

[![Travis build
status](https://travis-ci.org/ropenscilabs/syn.svg?branch=master)](https://travis-ci.org/ropenscilabs/syn)[![AppVeyor
build
status](https://ci.appveyor.com/api/projects/status/github/ropenscilabs/syn?branch=master&svg=true)](https://ci.appveyor.com/project/ropenscilabs/syn)[![Coverage
status](https://codecov.io/gh/ropenscilabs/syn/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/syn?branch=master)

The goal of `syn` is to provide two main functions:

  - `syn`, which generates synonyms
  - `ant`, which generates antonyms

(Currently only `syn` is working, `ant`, will be developed in the
future.)

## Where does the data come from?

The data comes from [`words/moby`](https://github.com/words/moby)
repository, which, in their words:

> …[moby-thesaurus.org](http://moby-thesaurus.org) is a free and
> open-source website designed to facilitate meanderings through the
> [Moby Thesaurus](http://en.wikipedia.org/wiki/Moby_Project#Thesaurus),
> the largest thesaurus in the English language. As of version 1.0, this
> package also includes synonym data from the [Open Office
> thesaurus](http://goo.gl/UGBfHI).

## Synonyms for “cool”

The `syn` function returns all synonyms for a given word:

Let’s look at synonyms for “cool”:

``` r
library(syn)

syn_cool <- syn("cool")

head(syn_cool)
#> [1] "cool"                  "Buddha-like composure" "Laodicean"            
#> [4] "OK"                    "Olympian"              "Oriental calm"
tail(syn_cool)
#> [1] "withhold"       "without nerves" "wizard"         "wonderless"    
#> [5] "wonderlessness" "zealless"
```

Wow, there are a lot\! How many are there?

``` r
length(syn_cool)
#> [1] 618
```

Wow\! There are 618 synonyms for cool. That’s…unmoved, I guess.

## Set the number of words to return

You can also provide it a number of words to return with the `n_words`
argument, which will randomly select the number of words given

``` r
syn("awesome", 1)
#> [1] "heavenly"
syn("awesome", 2)
#> [1] "bulky"        "unbelievable"
syn("awesome", 5)
#> [1] "glorified"   "monster"     "held in awe" "estimable"   "excellent"
```

OK cool, let’s use these in a sentence, using the `glue` package.

## Example: Creating a sentence

Which of these better?

``` r

glue::glue("This is really cool!")
#> This is really cool!
glue::glue("This is really {syn('cool', 1)}!")
#> This is really unastonished!
glue::glue("This is really {syn('cool', 10)}!")
#> This is really solitary!
#> This is really hold in check!
#> This is really at rest!
#> This is really nothing in excess!
#> This is really frozen to death!
#> This is really undazed!
#> This is really coldness!
#> This is really firm as Gibraltar!
#> This is really air-condition!
#> This is really ice!
```

## Using multiple words

You can generate synonyms for multiple words with the `syns` function.
This takes a vector of words, returning a named list

``` r
syns_good_evil <- syns(c("good", "evil"))
str(syns_good_evil)
#> List of 2
#>  $ good: chr [1:667] "good" "Christian" "Christlike" "Christly" ...
#>  $ evil: chr [1:365] "evil" "Loki" "Nemesis" "Set" ...
```

You can also provide `n_words` for `syns`, and it will return a random
number of the words.

``` r
syns(c("good", "evil"),
     n_words =  10)
#> $good
#>  [1] "verisimilar"  "needed"       "delectable"   "adept"       
#>  [5] "agreeable"    "straight"     "material"     "unfictitious"
#>  [9] "sweet"        "compelling"  
#> 
#> $evil
#>  [1] "sin of commission" "evildoing"         "not the thing"    
#>  [4] "destructive"       "amorality"         "delinquent"       
#>  [7] "unlawful"          "scandal"           "awful"            
#> [10] "catastrophic"
```

## Code of Conduct

Please note that the ‘syn’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms.
