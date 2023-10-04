data_loading = function(date_start,
                        date_end){
  
  oil_prices = tidyquant::tq_get("DCOILBRENTEU", 
                              get = "economic.data", 
                              from = date_start,
                              to = date_end) %>% 
    dplyr::select(date = date, oil_price = price) %>% 
    dplyr::arrange(date)
  
  bond_spread = tidyquant::tq_get("T10Y2Y", 
                                  get = "economic.data", 
                                  from = date_start,
                                  to = date_end) %>% 
    dplyr::select(date = date, bond_spread = price) %>% 
    dplyr::arrange(date)
  
  usd_eur_exchange = tidyquant::tq_get("DEXUSEU", 
                                  get = "economic.data", 
                                  from = date_start,
                                  to = date_end) %>% 
    dplyr::select(date = date, usd_exchange = price) %>% 
    dplyr::arrange(date)
  
  all_together_list = list(oil_prices, bond_spread, 
                           usd_eur_exchange)
  
  all_together = all_together_list %>% 
    purrr::reduce(dplyr::full_join)
  
  return(all_together)
}


