# syn 0.1.0 "Antonym"

* Implemented `n_words` to count the number of words in a string. This can be
  useful for subsetting your synonyms.
* ensured that words are converted to lowercase when looked up (#27)
* Easter Egg: Package name was created with `syn::syn("synonym")[2]`

# syn 0.0.1 "Actual Thing"

* Implemented `ant` and `ants` functions using imported antonym dataset from wordnet - see cool work by Mike Cheng: [#20](https://github.com/njtierney/syn/pull/20).
* Add a hex sticker, add and improve upon website
* Zero dependencies
* Rewrite core data structure to be a list of integer vectors. This brings the package below 5MB and does away with the need of all the
  dynamic download/load infrastructure
  
# syn 0.0.0.9000

* Initial release at ozunconf2018
* Added a `NEWS.md` file to track changes to the package.
* Added `syn` and `syns` and tricks to download and install the data from words repo
