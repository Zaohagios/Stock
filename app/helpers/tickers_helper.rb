module TickersHelper
    def Get_Price(ticker)
        StockQuote::Stock.quote(ticker).last_trade_price_only
    end
    
    def Get_Profit_Price(t)
       ((t.buy_price * t.units + t.fee + t.profit) / t.units)
    end
    
    def Get_To_Goal(t)
        Get_Profit_Price(t) - Get_Price(t.ticker_symbol)
    end


    def Tool_Tip_HTML()
       ("class=\"header-tooltip\" href=\"#\" data-toggle=\"tooltip\" data-placement=\"auto\" title=").html_safe
    end
end