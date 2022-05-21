library(rvest)
library(dplyr)

link = "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc"
page = read_html(link)

name = page %>% html_nodes(".lister-item-header a") %>% html_text()
year = page %>% html_nodes(".text-muted.unbold") %>% html_text()
uservotes = page %>% html_nodes(".sort-num_votes-visible span:nth-child(2)") %>% html_text()
rating = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()

movies = data.frame(name, year, uservotes,rating,stringsAsFactors = FALSE)
write.csv(movies, "movies.csv")
