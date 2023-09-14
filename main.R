library(magrittr)
#-------------------------------------------------------------------------------

targets::tar_make()

#-------------------------------------------------------------------------------

targets::tar_load("raw_data")
targets::tar_load("cleaned_data")

#-------------------------------------------------------------------------------

symbols = c("DANSKE.CO", "NOVO-B.CO")

symbols,

prices = tidyquant::tq_get(symbols,
                           from = date_start,
                           to = date_end,
                           get = "stock.prices") %>% 
  dplyr::arrange(date) %>% 
  dplyr::group_by(hour = lubridate::hour(date), symbol) %>%
  dplyr::mutate(percent_change = (log(close) - log(dplyr::lag(close))) * 100) %>%
  dplyr::ungroup() %>%
  tidyr::drop_na() %>% 
  dplyr::select(date, symbol, percent_change, open, close)

diff(prices$close, 1)

novo = prices %>% 
  dplyr::filter(symbol == "NOVO-B.CO")
danske = prices %>% 
  dplyr::filter(symbol == "DANSKE.CO")


plot(x = novo$date, y = novo$percent_change, type = "l")
lines(x = danske$date, y = danske$percent_change, col = "red")

olie = Quandl::Quandl("OPEC/ORB", type = "xts")

hej = Quandl::Quandl.search("oil price", per_page = 100) %>% 
  dplyr::filter(frequency == "daily")


olie_tibble = xts_to_tibble(olie)

hej = 5