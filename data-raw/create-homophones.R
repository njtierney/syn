

# SoundEx encoding of all our 'syn' words
soundex_phons <- as.integer(as.factor(stringdist::phonetic(all_words)))

# Double Metaphone encoding of all our 'syn' words
dbl_metaphone_phons_all <- PGRdup::DoubleMetaphone(all_words)

# Split DoubleMetaphone result in 'primary' and 'alternate'
dbl_metaphone_phons1    <- dbl_metaphone_phons_all$primary
dbl_metaphone_phons2    <- dbl_metaphone_phons_all$alternate

# Create a list of all possible phonetic encodings we see
all_dbm_codes <- sort(unique(c(dbl_metaphone_phons1, dbl_metaphone_phons2)))

# Turn the metaphone encodings into integer groups
dbl_metaphone_phons1    <- as.integer(factor(dbl_metaphone_phons1, levels = all_dbm_codes))
dbl_metaphone_phons2    <- as.integer(factor(dbl_metaphone_phons2, levels = all_dbm_codes))

# Check sizes
# pryr::object_size(soundex_phons)
# pryr::object_size(dbl_metaphone_phons1)
# pryr::object_size(dbl_metaphone_phons2)


# Create single datastructure with all the phonetic encodings
all_phons <- list(
  dbm_primary   = dbl_metaphone_phons1,
  dbm_alternate = dbl_metaphone_phons2,
  soundex       = soundex_phons
)


