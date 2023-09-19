library(stringr)

str_view(words, "^[^aeiou]{3}", match = T)
df <- tibble(
  word = words,
  i = seq_along(word)
)
df %>%
  filter(str_detect(words, "^x|x$"))
df %>%
  mutate(mean = str_count(words, "[aeiou]")/str_count(words, ".")) %>%
  arrange(desc(mean))

color <- c("red", "orange", "yellow", "green", "blue", "purple")
color_match <- str_c(color, collapse = "|")
str_extract(more, color_match)
more <- sentences[str_count(sentences, color_match) > 1]
str_subset(sentences, color_match)
df %>%
  mutate(first <- str_detect(words, 1))

noun <- "(a|the) ([^ ]+)"
has_noun <- sentences %>%
  str_subset(noun) %>%
  head(10)
has_noun %>%
  str_extract(noun)

tibble(sentence = sentences) %>%
  tidyr::extract(
    sentence, c("article", "noun"), "([^ ]+(')[^ ]+)",
    remove = FALSE
  )

number <- "(one|two|three|four|five|six|seven|eight|nine|ten) ([^ ]+)"
has_number <- sentences %>%
  str_subset(number) %>%
  str_match(number)
has_number[,3]

short <- "([^ ]+(')[^ ]+)"
has_short <- sentences %>%
  str_subset(short) %>%
  str_match(short)
df4 <- has_short[,2]
str_split(string = df4, pattern = "'", n = 2) 

words2 <- words %>% 
  str_replace("(^[^ ])(.*)([^ ]$)", "\\3\\2\\1")

words[match(words, words2) %>% na.omit()]

str_split("A|B|C|D", "\\|")
