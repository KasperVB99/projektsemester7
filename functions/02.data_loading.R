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
  
  soybean_oil_futures = tidyquant::tq_get("ZL=F", 
                                          from = date_start,
                                          to = date_end) %>%
    dplyr::select(date = date, soybean_oil_futures = close) %>% 
    dplyr::arrange(date)
  
  emini_crude_futures = tidyquant::tq_get("QM=F", 
                                          from = date_start,
                                          to = date_end) %>% 
    dplyr::select(date = date, emini_crude_futures = close) %>% 
    dplyr::arrange(date)
  
  micro_gold_futures = tidyquant::tq_get("MGC=F", 
                                         from = date_start,
                                         to = date_end) %>% 
    dplyr::select(date = date, micro_gold_futures = close) %>% 
    dplyr::arrange(date)
  
  silver_future = tidyquant::tq_get("SI=F", 
                                    from = date_start,
                                    to = date_end) %>% 
    dplyr::select(date = date, silver_future = close) %>% 
    dplyr::arrange(date)
  
  dow_jones = tidyquant::tq_get("^DJI", 
                                from = date_start,
                                to = date_end) %>% 
    dplyr::select(date = date, dow_jones = close) %>% 
    dplyr::arrange(date)
  
  sp500 = tidyquant::tq_get("^GSPC", 
                            from = date_start,
                            to = date_end) %>% 
    dplyr::select(date = date, sp500 = close) %>% 
    dplyr::arrange(date)
  
  corn_future = tidyquant::tq_get("ZC=F", 
                                  from = date_start,
                                  to = date_end) %>% 
    dplyr::select(date = date, corn_future = close) %>% 
    dplyr::arrange(date)
  
  USD_future = tidyquant::tq_get("DX=F", 
                                 from = date_start,
                                 to = date_end) %>% 
    dplyr::select(date = date, USD_future = close) %>% 
    dplyr::arrange(date)
  
  usa_brent_fund = tidyquant::tq_get("BNO", 
                                     from = date_start,
                                     to = date_end) %>% 
    dplyr::select(date = date, usa_brent_fund = close) %>% 
    dplyr::arrange(date)
  
  dow_jones_transportation = tidyquant::tq_get("^DJT", 
                                               from = date_start,
                                               to = date_end) %>% 
    dplyr::select(date = date, dow_jones_transportation = close) %>% 
    dplyr::arrange(date)
  
  natural_gas_future = tidyquant::tq_get("NG=F", 
                                         from = date_start,
                                         to = date_end) %>% 
    dplyr::select(date = date, natural_gas_future = close) %>% 
    dplyr::arrange(date)
  
  rbob_gasoline_future = tidyquant::tq_get("RB=F", 
                                           from = date_start,
                                           to = date_end) %>% 
    dplyr::select(date = date, rbob_gasoline_future = close) %>% 
    dplyr::arrange(date)
  
  usa_natural_gas_fund = tidyquant::tq_get("UNG", 
                                           from = date_start,
                                           to = date_end) %>% 
    dplyr::select(date = date, usa_natural_gas_fund = close) %>% 
    dplyr::arrange(date)
  
  proshares_bloomb_nature_gas = tidyquant::tq_get("BOIL", 
                                                  from = date_start,
                                                  to = date_end) %>% 
    dplyr::select(date = date, proshares_bloomb_nature_gas = close) %>% 
    dplyr::arrange(date)
  
  proshares_vix_short_t_futures = tidyquant::tq_get("UVXY", 
                                                    from = date_start,
                                                    to = date_end) %>% 
    dplyr::select(date = date, proshares_vix_short_t_futures = close) %>% 
    dplyr::arrange(date)
  
  chicago_srw_wheat_futures = tidyquant::tq_get("ZW=F", 
                                                from = date_start,
                                                to = date_end) %>% 
    dplyr::select(date = date, chicago_srw_wheat_futures = close) %>% 
    dplyr::arrange(date)
  
  mini_chicago_srw_wheat_futures = tidyquant::tq_get("XW=F", 
                                                     from = date_start,
                                                     to = date_end) %>% 
    dplyr::select(date = date, mini_chicago_srw_wheat_futures = close) %>% 
    dplyr::arrange(date)
  
  chicago_srw_wheat_tas_futures = tidyquant::tq_get("ZWT=F", 
                                                    from = date_start,
                                                    to = date_end) %>% 
    dplyr::select(date = date, chicago_srw_wheat_tas_futures = close) %>% 
    dplyr::arrange(date)
  
  pimco_commodity_fund = tidyquant::tq_get("PCRRX", 
                                           from = date_start,
                                           to = date_end) %>% 
    dplyr::select(date = date, pimco_commodity_fund = close) %>% 
    dplyr::arrange(date)
  
  dfa_commodity_strategy_inst = tidyquant::tq_get("DCMSX", 
                                                  from = date_start,
                                                  to = date_end) %>% 
    dplyr::select(date = date, dfa_commodity_strategy_inst = close) %>% 
    dplyr::arrange(date)
  
  credit_suisse_commodity_i = tidyquant::tq_get("CRSOX", 
                                                from = date_start,
                                                to = date_end) %>% 
    dplyr::select(date = date, credit_suisse_commodity_i = close) %>% 
    dplyr::arrange(date)
  
  blackrock_commodity_portfolio = tidyquant::tq_get("BCSAX", 
                                                    from = date_start,
                                                    to = date_end) %>% 
    dplyr::select(date = date, blackrock_commodity_portfolio = close) %>% 
    dplyr::arrange(date)
  
  invesco_balance_risk_commodity = tidyquant::tq_get("BRCAX", 
                                                     from = date_start,
                                                     to = date_end) %>% 
    dplyr::select(date = date, invesco_balance_risk_commodity = close) %>% 
    dplyr::arrange(date)
  
  mfs_commodity_stat_a = tidyquant::tq_get("MCSAX", 
                                           from = date_start,
                                           to = date_end) %>% 
    dplyr::select(date = date, mfs_commodity_stat_a = close) %>% 
    dplyr::arrange(date)
  
  all_together_list = list(oil_prices_europe, oil_prices_wti, bond_spread, 
                           usd_eur_exchange, oil_volatility_etf, nat_gas_price,
                           gulf_gasoline_price, ny_gasoline_price, rbob_prices_la,
                           moody_corp_bond_yield, soybean_oil_futures, emini_crude_futures,
                           micro_gold_futures, silver_future, dow_jones, 
                           sp500, corn_future, USD_future,
                           usa_brent_fund, dow_jones_transportation, natural_gas_future,
                           rbob_gasoline_future, usa_natural_gas_fund, proshares_bloomb_nature_gas,
                           proshares_vix_short_t_futures, chicago_srw_wheat_futures, mini_chicago_srw_wheat_futures,
                           pimco_commodity_fund, dfa_commodity_strategy_inst, credit_suisse_commodity_i,
                           blackrock_commodity_portfolio, invesco_balance_risk_commodity, mfs_commodity_stat_a)
  
  all_together = all_together_list %>% 
    purrr::reduce(dplyr::full_join) %>% 
    dplyr::arrange(date) %>% 
    dplyr::mutate(positive_oil_return = 
                    as.factor(dplyr::if_else(log(oil_price_europe / dplyr::lag(oil_price_europe)) 
                                             > 0, 1, 0))) %>% 
    dplyr::mutate(dplyr::across(tidyselect::where(is.numeric), ~ . - dplyr::lag(.))) %>% 
    timetk::tk_augment_lags(tidyselect::where(is.numeric), 
                            .lags = 1:3) %>% 
    dplyr::mutate(rolling_mean = slider::slide_index_dbl(as.numeric(positive_oil_return), 
                                                         .i = date, 
                                                         .f = mean, 
                                                         na.rm = TRUE, 
                                                         .before = lubridate::days(3), 
                                                         .after = -lubridate::days(1)) - 1) %>% 
    dplyr::select(date, positive_oil_return, rolling_mean, dplyr::contains("lag")) %>% 
    tidyr::drop_na()
  
  return(all_together)
}


