
<!-- README.md is generated from README.Rmd. Please edit that file -->

# syn <img src="man/figures/logo.png" align="right" height=140/>

<!-- badges: start -->

[![R-CMD-check](https://github.com/ropenscilabs/syn/workflows/R-CMD-check/badge.svg)](https://github.com/ropenscilabs/syn/actions)[![Coverage
status](https://codecov.io/gh/ropenscilabs/syn/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/syn?branch=master)[![Project
Status: Active – The project has reached a stable, usable state and is
being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/syn)](https://cran.r-project.org/package=syn)[![CRAN
Logs](http://cranlogs.r-pkg.org/badges/syn)](http://cran.rstudio.com/web/packages/syn/index.html)
<!-- badges: end -->

`syn` is a **zero dependency** R package that lists synonyms and
antonyms.

There are two main functions:

-   `syn("great")` Returns synonyms of “great”
-   `ant("great")` Returns antonyms of “great”.

`syn` and `ant` take one word as input. To return synonyms for many
words, use the plural form: `syn`**s**, and `ant`**s**

-   `syns(c("great", "excellent")` Returns named list of synonyms of
    “great”, and “excellent”
-   `ants(c("great", "excellent")` Returns named list of antonyms of
    “great”, and “excellent”

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

Wow, there are a lot! How many are there?

``` r
length(syn_cool)
#> [1] 618
```

Wow! There are 618 synonyms for cool. That’s…restrain, I guess.

You can also provide it a number of words to return with the `n_words`
argument, which will randomly select the number of words given

``` r
syn("awesome", 1)
#> [1] "moving"
syn("awesome", 2)
#> [1] "formidable" "excellent"
syn("awesome", 5)
#> [1] "spacious"     "immortalized" "amazing"      "uncanny"      "big"
```

## Example: Creating a sentence

OK cool, let’s use these in a sentence, using the `glue` package. Which
of these better?

``` r
glue::glue("This is really cool!")
#> This is really cool!
glue::glue("This is really {syn('cool', 1)}!")
#> This is really expectation!
glue::glue("This is really {syn('cool', 10)}!")
#> This is really decelerate!
#> This is really frosty!
#> This is really nonchalant!
#> This is really fab!
#> This is really soundness!
#> This is really hold up!
#> This is really indisturbance!
#> This is really unsurprised!
#> This is really standoffish!
#> This is really hushed!
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
#>  [1] "hallowed"             "diplomatic"           "law-abiding"         
#>  [4] "unchanging"           "following the letter" "succulent"           
#>  [7] "fresh"                "fortunate"            "law-revering"        
#> [10] "normal"              
#> 
#> $evil
#>  [1] "nefarious"   "terrible"    "matter"      "malfeasance" "grisly"     
#>  [6] "torment"     "mischievous" "bitchy"      "crime"       "catastrophe"
```

## Example: Antonyms (under development)

To create antonyms, use `ant` and `ants`, which have the same inputs as
`syn`. However, at this stage, the number of antonyms available for use
by `ant` is small.

``` r
ant("good")
#> [1] "bad"  "evil"
ant("good",1)
#> [1] "evil"

ant("strong")
#> [1] "weak"
```

``` r
ants(c("good", "evil"))
#> $good
#> [1] "bad"  "evil"
#> 
#> $evil
#> [1] "good"

ants(c("good", "evil"), n_words = 5)
#> $good
#> [1] "bad"  "evil"
#> 
#> $evil
#> [1] "good"

ants(c("strong", "weak"))
#> $strong
#> [1] "weak"
#> 
#> $weak
#> [1] "strong"
```

## Example: Filtering by the number of words in a synonym

Let’s say that you want to filter something down to those synonyms that
only contain one word. You can use the `n_words` argument, which
calculates the number of words for each

``` r
syn_end <- syn("end")

n_words(syn_end)
#>   [1] 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 2 1 1 2 1 1 1 1 1 1 1 1 1 1 3 3 2 1 1 3 2 2
#>  [38] 2 1 1 2 2 3 2 1 1 1 2 2 1 1 2 2 1 1 2 2 1 1 1 2 1 2 2 3 1 1 1 1 1 1 3 1 1
#>  [75] 1 1 1 1 1 2 2 1 2 1 1 1 2 2 1 1 1 1 1 2 2 2 3 3 1 1 1 1 1 1 1 1 1 1 2 1 1
#> [112] 1 1 1 3 1 1 1 1 1 1 1 2 3 2 2 1 2 1 2 1 1 1 1 2 1 1 3 1 1 1 2 1 1 1 1 3 1
#> [149] 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 2 3 2 3 1 1 1 2 1 3 1 3 3 2 1 1
#> [186] 1 2 2 1 1 1 1 1 1 1 1 1 1 1 2 2 2 1 1 1 1 2 2 2 2 1 1 1 1 1 3 1 1 2 2 1 1
#> [223] 1 1 1 1 1 1 1 3 1 2 2 1 1 1 1 2 3 3 2 3 2 1 1 1 1 1 2 1 2 1 1 1 1 1 3 3 1
#> [260] 1 2 2 1 1 1 1 3 1 1 1 1 1 1 1 3 1 1 1 1 1 3 2 2 2 2 2 2 3 2 2 1 2 1 1 1 1
#> [297] 1 2 1 3 1 1 1 3 1 2 2 1 1 3 3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 3 1 2 1 3 1
#> [334] 3 2 1 1 1 1 1 2 1 1 1 1 1 1 2 1 2 2 1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2
#> [371] 1 1 3 1 1 1 2 2 3 3 3 1 1 1 1 1 1 1 1 1 1 1 1 1 3 1 1 1 1 1 1 1 1 3 1 1 1
#> [408] 1 1 1 1 1 1 1 1 1 2 2 2 1 1 1 2 1 1 1 1 1 1 1 1 1 3 3 1 3 1 1 1 1 1 1 2 1
#> [445] 1 1 1 1 1 2 1 1 1 1 1 1 1 2 2 1 1 1 1 1 1 1 1 1 1 2 2 1 1 1 1 1 1 1 1 1 1
#> [482] 1 1 3 1 1 1 1 2 2 1 2 1 1 1 1 2 1 1 1 2 1 2 1 1 1 2 2 2 1 1 2 1 2 1 2 1 1
#> [519] 1 1 1 1 1 2 1 1 2 1 1 1 1 1 1 3 3 2 1 1 2 2 1 1 2 1
syn_end_l1 <- syn_end[n_words(syn_end) <= 1]
syn_end_l1
#>   [1] "abandon"         "abort"           "accomplishment"  "acme"           
#>   [5] "afterglow"       "afterimage"      "aim"             "all"            
#>   [9] "allotment"       "allowance"       "annihilate"      "annihilation"   
#>  [13] "answer"          "apogee"          "archer"          "arrest"         
#>  [17] "astrology"       "athlete"         "attend"          "balance"        
#>  [21] "ballplayer"      "bane"            "baseballer"      "baseman"        
#>  [25] "batter"          "battery"         "belay"           "bell"           
#>  [29] "bit"             "bite"            "borderline"      "bound"          
#>  [33] "boundary"        "bourn"           "bowman"          "budget"         
#>  [37] "butt"            "by-end"          "by-purpose"      "cancel"         
#>  [41] "cap"             "catastrophe"     "catcher"         "cease"          
#>  [45] "ceiling"         "center"          "cessation"       "chaff"          
#>  [49] "check"           "checkmate"       "chip"            "chloroform"     
#>  [53] "chunk"           "circumscription" "climax"          "clip"           
#>  [57] "clipping"        "close"           "closing"         "closure"        
#>  [61] "coach"           "coda"            "collop"          "commission"     
#>  [65] "compass"         "competitor"      "complete"        "completing"     
#>  [69] "completion"      "conclude"        "conclusion"      "confine"        
#>  [73] "confines"        "constellation"   "consummation"    "contingent"     
#>  [77] "cracking"        "cricketer"       "crown"           "crumb"          
#>  [81] "culminate"       "culmination"     "cup"             "curtains"       
#>  [85] "cut"             "cutoff"          "cutting"         "deadline"       
#>  [89] "deadlock"        "deal"            "death"           "deathblow"      
#>  [93] "debris"          "decease"         "decipherment"    "decoding"       
#>  [97] "delimitation"    "demise"          "denouement"      "departure"      
#> [101] "desist"          "desistance"      "destination"     "destiny"        
#> [105] "destroy"         "desuetude"       "determinant"     "determination"  
#> [109] "determine"       "detritus"        "develop"         "die"            
#> [113] "disappear"       "discontinuance"  "discontinuation" "discontinue"    
#> [117] "disentanglement" "dispatch"        "dissolution"     "dividend"       
#> [121] "dole"            "dollop"          "doom"            "dying"          
#> [125] "end"             "endgame"         "ending"          "ensue"          
#> [129] "eventuate"       "execute"         "exit"            "expiration"     
#> [133] "expire"          "explanation"     "exterminate"     "extinction"     
#> [137] "extinguishment"  "extreme"         "extremity"       "fare"           
#> [141] "fatality"        "fate"            "filings"         "finale"         
#> [145] "finality"        "finalize"        "finding"         "finding-out"    
#> [149] "finis"           "finish"          "finishing"       "floor"          
#> [153] "follow"          "footballer"      "foredoom"        "fortune"        
#> [157] "fossil"          "fragment"        "Friday"          "frontier"       
#> [161] "future"          "game"            "games-player"    "gamester"       
#> [165] "go"              "goal"            "gob"             "gobbet"         
#> [169] "going"           "grave"           "guard"           "gun"            
#> [173] "half"            "halt"            "halver"          "hedge"          
#> [177] "helping"         "hold"            "holdover"        "hunk"           
#> [181] "husks"           "immolate"        "inevitability"   "infielder"      
#> [185] "interest"        "interface"       "interpretation"  "issue"          
#> [189] "jock"            "jumper"          "kill"            "kismet"         
#> [193] "knell"           "leaving"         "leavings"        "leftovers"      
#> [197] "limen"           "limit"           "limitation"      "line"           
#> [201] "lineman"         "liquidate"       "lockout"         "lot"            
#> [205] "lump"            "lynch"           "march"           "mark"           
#> [209] "martyr"          "martyrize"       "maturation"      "maturity"       
#> [213] "maximum"         "measure"         "meed"            "mess"           
#> [217] "mete"            "modicum"         "moiety"          "moira"          
#> [221] "morsel"          "nip"             "object"          "objective"      
#> [225] "offscourings"    "orts"            "outcome"         "outfield"       
#> [229] "outfielder"      "paring"          "parings"         "part"           
#> [233] "particle"        "parting"         "pass"            "passing"        
#> [237] "payoff"          "peak"            "percentage"      "perfect"        
#> [241] "perfection"      "period"          "perish"          "perishing"      
#> [245] "perorate"        "piece"           "pinnacle"        "planets"        
#> [249] "player"          "poison"          "poloist"         "portion"        
#> [253] "prey"            "proportion"      "prove"           "pugilist"       
#> [257] "purge"           "pursuit"         "quantum"         "quarry"         
#> [261] "quarterback"     "quietus"         "quintain"        "quit"           
#> [265] "quota"           "racer"           "rags"            "rake-off"       
#> [269] "rasher"          "ration"          "reason"          "refrain"        
#> [273] "refuse"          "release"         "relics"          "relinquish"     
#> [277] "remainder"       "remains"         "remnant"         "renounce"       
#> [281] "residue"         "residuum"        "resolution"      "resolve"        
#> [285] "resolving"       "rest"            "result"          "reward"         
#> [289] "riddling"        "ripeness"        "roach"           "rubbish"        
#> [293] "ruins"           "rump"            "sacrifice"       "sawdust"        
#> [297] "scoop"           "scourings"       "scrap"           "scraps"         
#> [301] "scratch"         "scrub"           "segment"         "shadow"         
#> [305] "shard"           "share"           "shaving"         "shavings"       
#> [309] "shiver"          "shred"           "skater"          "slaughter"      
#> [313] "slay"            "sleep"           "slice"           "sliver"         
#> [317] "smithereen"      "snack"           "snatch"          "snip"           
#> [321] "snippet"         "solution"        "solving"         "splinter"       
#> [325] "sport"           "sportsman"       "stake"           "stalemate"      
#> [329] "stand"           "standoff"        "standstill"      "stars"          
#> [333] "start"           "starve"          "stay"            "stitch"         
#> [337] "stock"           "stop"            "stoppage"        "straw"          
#> [341] "strike"          "stubble"         "stump"           "succumb"        
#> [345] "summit"          "survival"        "sweepings"       "tackle"         
#> [349] "tailback"        "target"          "tatter"          "teleology"      
#> [353] "term"            "terminal"        "terminate"       "termination"    
#> [357] "terminus"        "threshold"       "tip"             "to"             
#> [361] "top"             "toxophilite"     "trace"           "ultimate"       
#> [365] "unfold"          "unraveling"      "unriddling"      "unscrambling"   
#> [369] "unspinning"      "untangling"      "untwisting"      "unweaving"      
#> [373] "upshot"          "utmost"          "uttermost"       "vanish"         
#> [377] "vestige"         "walkout"         "waste"           "weird"          
#> [381] "windup"          "wingback"        "working"         "working-out"    
#> [385] "wrestler"
```

## Code of Conduct

Please note that the syn project is released with a [Contributor Code of
Conduct](http://syn.njtierney.com/CODE_OF_CONDUCT.html). By contributing
to this project, you agree to abide by its terms.
