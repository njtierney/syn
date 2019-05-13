
<!-- README.md is generated from README.Rmd. Please edit that file -->

# syn <img src="man/figures/logo.png" align="right" height=140/>

[![Travis build
status](https://travis-ci.org/ropenscilabs/syn.svg?branch=master)](https://travis-ci.org/ropenscilabs/syn)[![AppVeyor
build
status](https://ci.appveyor.com/api/projects/status/github/ropenscilabs/syn?branch=master&svg=true)](https://ci.appveyor.com/project/ropenscilabs/syn)[![Coverage
status](https://codecov.io/gh/ropenscilabs/syn/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/syn?branch=master)[![Project
Status: Active – The project has reached a stable, usable state and is
being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

`syn` is a **zero dependency** R package that lists synonyms and
antonyms.

There are two main functions:

  - `syn("great")` Returns synonyms of “great”
  - `ant("great")` Returns antonyms of “great”.

`syn` and `ant` take one word as input. To return synonyms for many
words, use the plural form: `syn`**s**, and `ant`**s**

  - `syns(c("great", "excellent")` Returns named list of synonyms of
    “great”, and “excellent”
  - `ants(c("great", "excellent")` Returns named list of antonyms of
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

Wow, there are a lot\! How many are there?

``` r
length(syn_cool)
#> [1] 618
```

Wow\! There are 618 synonyms for cool. That’s…strained, I guess.

You can also provide it a number of words to return with the `n_words`
argument, which will randomly select the number of words given

``` r
syn("awesome", 1)
#> [1] "inexpressible"
syn("awesome", 2)
#> [1] "divine"  "immense"
syn("awesome", 5)
#> [1] "gigantic" "exalted"  "huge"     "dreadful" "gruesome"
```

## Example: Creating a sentence

OK cool, let’s use these in a sentence, using the `glue` package. Which
of these better?

``` r

glue::glue("This is really cool!")
#> This is really cool!
glue::glue("This is really {syn('cool', 1)}!")
#> This is really hold fast!
glue::glue("This is really {syn('cool', 10)}!")
#> This is really chilliness!
#> This is really premeditated!
#> This is really stillish!
#> This is really sober!
#> This is really assassinate!
#> This is really assured!
#> This is really mollify!
#> This is really reposeful!
#> This is really inexcitable!
#> This is really icy calm!
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
#>  [1] "champion"          "merchandise"       "crack"            
#>  [4] "glorious"          "behoof"            "assuredly"        
#>  [7] "spiritual"         "personal property" "superb"           
#> [10] "merciful"         
#> 
#> $evil
#>  [1] "unprincipled" "crying evil"  "disaster"     "abnormal"    
#>  [5] "amorality"    "grievance"    "wantonness"   "foulness"    
#>  [9] "Typhon"       "unpromising"
```

## Example: Antonyms (under development)

To create antonyms, use `ant` and `ants`, which have the same inputs as
`syn`. However, at this stage, the number of antonyms available for use
by `ant` is small.

``` r
ant("good")
#> [1] "bad"  "evil"
ant("good",1)
#> [1] "bad"

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
#> [1] "evil" "bad" 
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
#>   [1] 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 2 1 1 2 1 1 1 1 1 1 1 1 1 1 3 3 2 1 1 3
#>  [36] 2 2 2 1 1 2 2 3 2 1 1 1 2 2 1 1 2 2 1 1 2 2 1 1 1 2 1 2 2 3 1 1 1 1 1
#>  [71] 1 3 1 1 1 1 1 1 1 2 2 1 2 1 1 1 2 2 1 1 1 1 1 2 2 2 3 3 1 1 1 1 1 1 1
#> [106] 1 1 1 2 1 1 1 1 1 3 1 1 1 1 1 1 1 2 3 2 2 1 2 1 2 1 1 1 1 2 1 1 3 1 1
#> [141] 1 2 1 1 1 1 3 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 2 3 2 3 1 1
#> [176] 1 2 1 3 1 3 3 2 1 1 1 2 2 1 1 1 1 1 1 1 1 1 1 1 2 2 2 1 1 1 1 2 2 2 2
#> [211] 1 1 1 1 1 3 1 1 2 2 1 1 1 1 1 1 1 1 1 3 1 2 2 1 1 1 1 2 3 3 2 3 2 1 1
#> [246] 1 1 1 2 1 2 1 1 1 1 1 3 3 1 1 2 2 1 1 1 1 3 1 1 1 1 1 1 1 3 1 1 1 1 1
#> [281] 3 2 2 2 2 2 2 3 2 2 1 2 1 1 1 1 1 2 1 3 1 1 1 3 1 2 2 1 1 3 3 1 1 1 1
#> [316] 1 1 1 1 1 1 1 1 1 1 2 1 3 1 2 1 3 1 3 2 1 1 1 1 1 2 1 1 1 1 1 1 2 1 2
#> [351] 2 1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 3 1 1 1 2 2 3 3 3 1 1 1 1
#> [386] 1 1 1 1 1 1 1 1 1 3 1 1 1 1 1 1 1 1 3 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 1
#> [421] 1 1 2 1 1 1 1 1 1 1 1 1 3 3 1 3 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1
#> [456] 1 1 2 2 1 1 1 1 1 1 1 1 1 1 2 2 1 1 1 1 1 1 1 1 1 1 1 1 3 1 1 1 1 2 2
#> [491] 1 2 1 1 1 1 2 1 1 1 2 1 2 1 1 1 2 2 2 1 1 2 1 2 1 2 1 1 1 1 1 1 1 2 1
#> [526] 1 2 1 1 1 1 1 1 3 3 2 1 1 2 2 1 1 2 1
syn_end_l1 <- syn_end[n_words(syn_end) <= 1]
syn_end_l1
#>   [1] "abandon"         "abort"           "accomplishment" 
#>   [4] "acme"            "afterglow"       "afterimage"     
#>   [7] "aim"             "all"             "allotment"      
#>  [10] "allowance"       "annihilate"      "annihilation"   
#>  [13] "answer"          "apogee"          "archer"         
#>  [16] "arrest"          "astrology"       "athlete"        
#>  [19] "attend"          "balance"         "ballplayer"     
#>  [22] "bane"            "baseballer"      "baseman"        
#>  [25] "batter"          "battery"         "belay"          
#>  [28] "bell"            "bit"             "bite"           
#>  [31] "borderline"      "bound"           "boundary"       
#>  [34] "bourn"           "bowman"          "budget"         
#>  [37] "butt"            "by-end"          "by-purpose"     
#>  [40] "cancel"          "cap"             "catastrophe"    
#>  [43] "catcher"         "cease"           "ceiling"        
#>  [46] "center"          "cessation"       "chaff"          
#>  [49] "check"           "checkmate"       "chip"           
#>  [52] "chloroform"      "chunk"           "circumscription"
#>  [55] "climax"          "clip"            "clipping"       
#>  [58] "close"           "closing"         "closure"        
#>  [61] "coach"           "coda"            "collop"         
#>  [64] "commission"      "compass"         "competitor"     
#>  [67] "complete"        "completing"      "completion"     
#>  [70] "conclude"        "conclusion"      "confine"        
#>  [73] "confines"        "constellation"   "consummation"   
#>  [76] "contingent"      "cracking"        "cricketer"      
#>  [79] "crown"           "crumb"           "culminate"      
#>  [82] "culmination"     "cup"             "curtains"       
#>  [85] "cut"             "cutoff"          "cutting"        
#>  [88] "deadline"        "deadlock"        "deal"           
#>  [91] "death"           "deathblow"       "debris"         
#>  [94] "decease"         "decipherment"    "decoding"       
#>  [97] "delimitation"    "demise"          "denouement"     
#> [100] "departure"       "desist"          "desistance"     
#> [103] "destination"     "destiny"         "destroy"        
#> [106] "desuetude"       "determinant"     "determination"  
#> [109] "determine"       "detritus"        "develop"        
#> [112] "die"             "disappear"       "discontinuance" 
#> [115] "discontinuation" "discontinue"     "disentanglement"
#> [118] "dispatch"        "dissolution"     "dividend"       
#> [121] "dole"            "dollop"          "doom"           
#> [124] "dying"           "end"             "endgame"        
#> [127] "ending"          "ensue"           "eventuate"      
#> [130] "execute"         "exit"            "expiration"     
#> [133] "expire"          "explanation"     "exterminate"    
#> [136] "extinction"      "extinguishment"  "extreme"        
#> [139] "extremity"       "fare"            "fatality"       
#> [142] "fate"            "filings"         "finale"         
#> [145] "finality"        "finalize"        "finding"        
#> [148] "finding-out"     "finis"           "finish"         
#> [151] "finishing"       "floor"           "follow"         
#> [154] "footballer"      "foredoom"        "fortune"        
#> [157] "fossil"          "fragment"        "Friday"         
#> [160] "frontier"        "future"          "game"           
#> [163] "games-player"    "gamester"        "go"             
#> [166] "goal"            "gob"             "gobbet"         
#> [169] "going"           "grave"           "guard"          
#> [172] "gun"             "half"            "halt"           
#> [175] "halver"          "hedge"           "helping"        
#> [178] "hold"            "holdover"        "hunk"           
#> [181] "husks"           "immolate"        "inevitability"  
#> [184] "infielder"       "interest"        "interface"      
#> [187] "interpretation"  "issue"           "jock"           
#> [190] "jumper"          "kill"            "kismet"         
#> [193] "knell"           "leaving"         "leavings"       
#> [196] "leftovers"       "limen"           "limit"          
#> [199] "limitation"      "line"            "lineman"        
#> [202] "liquidate"       "lockout"         "lot"            
#> [205] "lump"            "lynch"           "march"          
#> [208] "mark"            "martyr"          "martyrize"      
#> [211] "maturation"      "maturity"        "maximum"        
#> [214] "measure"         "meed"            "mess"           
#> [217] "mete"            "modicum"         "moiety"         
#> [220] "moira"           "morsel"          "nip"            
#> [223] "object"          "objective"       "offscourings"   
#> [226] "orts"            "outcome"         "outfield"       
#> [229] "outfielder"      "paring"          "parings"        
#> [232] "part"            "particle"        "parting"        
#> [235] "pass"            "passing"         "payoff"         
#> [238] "peak"            "percentage"      "perfect"        
#> [241] "perfection"      "period"          "perish"         
#> [244] "perishing"       "perorate"        "piece"          
#> [247] "pinnacle"        "planets"         "player"         
#> [250] "poison"          "poloist"         "portion"        
#> [253] "prey"            "proportion"      "prove"          
#> [256] "pugilist"        "purge"           "pursuit"        
#> [259] "quantum"         "quarry"          "quarterback"    
#> [262] "quietus"         "quintain"        "quit"           
#> [265] "quota"           "racer"           "rags"           
#> [268] "rake-off"        "rasher"          "ration"         
#> [271] "reason"          "refrain"         "refuse"         
#> [274] "release"         "relics"          "relinquish"     
#> [277] "remainder"       "remains"         "remnant"        
#> [280] "renounce"        "residue"         "residuum"       
#> [283] "resolution"      "resolve"         "resolving"      
#> [286] "rest"            "result"          "reward"         
#> [289] "riddling"        "ripeness"        "roach"          
#> [292] "rubbish"         "ruins"           "rump"           
#> [295] "sacrifice"       "sawdust"         "scoop"          
#> [298] "scourings"       "scrap"           "scraps"         
#> [301] "scratch"         "scrub"           "segment"        
#> [304] "shadow"          "shard"           "share"          
#> [307] "shaving"         "shavings"        "shiver"         
#> [310] "shred"           "skater"          "slaughter"      
#> [313] "slay"            "sleep"           "slice"          
#> [316] "sliver"          "smithereen"      "snack"          
#> [319] "snatch"          "snip"            "snippet"        
#> [322] "solution"        "solving"         "splinter"       
#> [325] "sport"           "sportsman"       "stake"          
#> [328] "stalemate"       "stand"           "standoff"       
#> [331] "standstill"      "stars"           "start"          
#> [334] "starve"          "stay"            "stitch"         
#> [337] "stock"           "stop"            "stoppage"       
#> [340] "straw"           "strike"          "stubble"        
#> [343] "stump"           "succumb"         "summit"         
#> [346] "survival"        "sweepings"       "tackle"         
#> [349] "tailback"        "target"          "tatter"         
#> [352] "teleology"       "term"            "terminal"       
#> [355] "terminate"       "termination"     "terminus"       
#> [358] "threshold"       "tip"             "to"             
#> [361] "top"             "toxophilite"     "trace"          
#> [364] "ultimate"        "unfold"          "unraveling"     
#> [367] "unriddling"      "unscrambling"    "unspinning"     
#> [370] "untangling"      "untwisting"      "unweaving"      
#> [373] "upshot"          "utmost"          "uttermost"      
#> [376] "vanish"          "vestige"         "walkout"        
#> [379] "waste"           "weird"           "windup"         
#> [382] "wingback"        "working"         "working-out"    
#> [385] "wrestler"
```

## Code of Conduct

Please note that the ‘syn’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms.
