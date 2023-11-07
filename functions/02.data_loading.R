data_loading = function(date_start,
                        date_end){
  
  oil_prices_europe = tidyquant::tq_get("DCOILBRENTEU", 
                                        get = "economic.data", 
                                        from = date_start,
                                        to = date_end) %>% 
    dplyr::select(date = date, oil_price_europe = price) %>% 
    dplyr::arrange(date)
  
  oil_prices_wti = tidyquant::tq_get("DCOILWTICO", 
                                     get = "economic.data", 
                                     from = date_start,
                                     to = date_end) %>% 
    dplyr::select(date = date, oil_price_wti = price) %>% 
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
  
  oil_volatility_etf = tidyquant::tq_get("OVXCLS", 
                                           get = "economic.data", 
                                           from = date_start,
                                           to = date_end) %>% 
    dplyr::select(date = date, oil_volatility_etf = price) %>% 
    dplyr::arrange(date)
  
  nat_gas_price = tidyquant::tq_get("DHHNGSP", 
                                  get = "economic.data", 
                                  from = date_start,
                                  to = date_end) %>% 
    dplyr::select(date = date, nat_gas_price = price) %>% 
    dplyr::arrange(date)
  
  gulf_gasoline_price = tidyquant::tq_get("DGASUSGULF", 
                                        get = "economic.data", 
                                        from = date_start,
                                        to = date_end) %>% 
    dplyr::select(date = date, gulf_gasoline_price = price) %>% 
    dplyr::arrange(date)
  
  ny_gasoline_price = tidyquant::tq_get("DGASNYH", 
                                        get = "economic.data", 
                                        from = date_start,
                                        to = date_end) %>% 
    dplyr::select(date = date, ny_gasoline_price = price) %>% 
    dplyr::arrange(date)
  
  rbob_prices_la = tidyquant::tq_get("DRGASLA", 
                                     get = "economic.data", 
                                     from = date_start,
                                     to = date_end) %>% 
    dplyr::select(date = date, rbob_prices_la = price) %>% 
    dplyr::arrange(date)
  
  moody_corp_bond_yield = tidyquant::tq_get("DHHNGSP", 
                    get = "economic.data", 
                    from = date_start,
                    to = date_end) %>% 
    dplyr::select(date = date, moody_corp_bond_yield = price) %>% 
    dplyr::arrange(date)
  
  all_together_list = list(oil_prices_europe, oil_prices_wti, bond_spread, 
                           usd_eur_exchange, oil_volatility_etf, nat_gas_price,
                           gulf_gasoline_price, ny_gasoline_price, rbob_prices_la,
                           moody_corp_bond_yield)
  
  all_together = all_together_list %>% 
    purrr::reduce(dplyr::full_join) %>% 
    dplyr::mutate(positive_oil_return = 
                    as.factor(dplyr::if_else(log(oil_price_europe / dplyr::lag(oil_price_europe)) 
                                             > 0, 1, 0))) %>% 
    dplyr::mutate(dplyr::across(tidyselect::where(is.numeric), ~ . - dplyr::lag(.))) %>% 
    timetk::tk_augment_lags(tidyselect::where(is.numeric), 
                            .lags = 1:3) %>% 
    dplyr::select(date, positive_oil_return, dplyr::contains("lag")) %>% 
    tidyr::drop_na()
  
  return(all_together)
}


