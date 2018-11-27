
<!-- README.md is generated from README.Rmd. Please edit that file -->

# syn

The goal of syn is to provide two main functions:

  - `syn`, which generates synonyms
  - `ant`, which generates antonyms

Currently only `syn` is working, `ant`, will be developed in the future.

## Synonyms for “cool”

The `syn` function returns all synonyms for a given word.

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

Wow\! There are 618 synonyms for cool. That’s…aguey, I guess.

## Set the number of words to return

You can also provide it a number of words to return with the `n_words`
argument, which will randomly select the number of words given

``` r
syn("awesome", 1)
#> [1] "fearful"
syn("awesome", 2)
#> [1] "mighty"   "infinite"
syn("awesome", 5)
#> [1] "high and mighty" "big"             "awesome"         "titanic"        
#> [5] "fearsome"
```

OK cool, let’s use these in a sentence, using the `glue` package.

## Example: Creating a sentence

Which of these better?

``` r

glue::glue("This is really cool!")
#> This is really cool!
glue::glue("This is really {syn('cool', 1)}!")
#> This is really chilly!
glue::glue("This is really {syn('cool', 10)}!")
#> This is really knock off!
#> This is really imperturbability!
#> This is really detached!
#> This is really insolent!
#> This is really prohibit!
#> This is really liquidate!
#> This is really tinctorial!
#> This is really pragmatic!
#> This is really glorious!
#> This is really half-frozen!
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
#>  [1] "changeless"     "esteemed"       "noble"          "profitable"    
#>  [5] "complimentary"  "constitutional" "yeomanly"       "minimum"       
#>  [9] "benignant"      "effects"       
#> 
#> $evil
#>  [1] "peccancy"     "arrant"       "ugly"         "can of worms"
#>  [5] "ill-boding"   "malefic"      "ruinous"      "angry"       
#>  [9] "flagitious"   "pestilence"
```
