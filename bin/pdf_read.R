library('tidyverse')
library('pdftools')
library('here')
library("tidytext")
library("tm")
kl_file <- here("lit/styring-af-det-specialiserede-voksenomraade.pdf")
stopord <- enframe(read_lines(here("data/stopord.txt")),name = "line", value = "word")
kl_txt <- pdf_text(kl_file) %>% 
    enframe(name = "page", value = "text") %>%
    unnest_tokens(word, text) %>%
    anti_join(stopord)

kl_wordcount <- kl_txt %>% count(word, sort = TRUE)

kl_data <- pdf_data(kl_file)
