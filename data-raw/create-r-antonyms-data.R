
# 'generate-wordnet-antonyms.py' use the NLTK to generate all the antonyms
#  in wordnet as described on stackoverflow here:
#  https://stackoverflow.com/questions/24192979/how-to-generate-a-list-of-antonyms-for-adjectives-in-wordnet-using-python
#
# Use 'generate-wordnet-antonyms.sh' to run the python code and
# then tidy the words a little
#
# 'wordnet-antonyms-cleaned.txt'
#  - one word/antonym pair per line (separated by a space)
#  - underscores are used within words to stand for spaces

library(dplyr)
library(purrr)

ants <- readLines(here::here("data-raw", "wordnet-antonyms-cleaned.txt"))


# Tidy into an R data.frame
# Might also want to use tolower() on everything?
ants <- strsplit(ants, " ")
ants <- purrr::map(ants, ~gsub("_", ' ', .x))

ant_df <- as_data_frame(do.call(rbind, ants))
colnames(ant_df) <- c('word1', 'word2')



# Mapping words in first column to antonyms in second
summary_df <- ant_df %>%
  group_by(word1) %>%
  summarise(
    words = list(word2)
  ) %>%
  ungroup()


words_ant <- summary_df$words
names(words_ant) <- summary_df$word1


