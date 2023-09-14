data_loading = function(date_start,
                        date_end){
  date_start = lubridate::with_tz(date_start, tzone = "CET")
  date_end = lubridate::with_tz(date_end, tzone = "CET")
  
  symbols = c("TSLA", "NFLX")
  
  prices = tidyquant::tq_get(symbols,
                             from = date_start,
                             to = date_end,
                             get = "stock.prices") %>% 
    dplyr::mutate(change = log(close - open)) %>% 
    dplyr::select(date, symbol, change, open, close)

  
  return(prices)
}
