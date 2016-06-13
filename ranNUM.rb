require 'json'
require 'net/http'


class RAN
def self.sp500file
    sp500_path = File.join( File.dirname(__FILE__), './textfiles/SP500.txt' )
    File.open( sp500_path )
end
def self.nnstocksfile
    nnstocks_path = File.join( File.dirname(__FILE__), './textfiles/nnstocks.txt' )
    File.open( nnstocks_path )
end
def self.owmfile
    owm_path = File.join( File.dirname(__FILE__), './textfiles/owmid.txt' )
    File.open( owm_path )
end
#get stock data
  def self.get_yql_data(ticker)
        url = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%3D%22#{ ticker }%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    resp = Net::HTTP.get_response(URI.parse(url))
    JSON.parse(resp.body)
  end
    def self.s_SYMBOL
    random_string_stocks = rand(500)
    IO.readlines(RAN.sp500file)[random_string_stocks]
    end

    def self.s_SYMBOL2
    random_string_stocks2 = rand(5910)
    IO.readlines(RAN.nnstocksfile)[random_string_stocks2]
    end
#get weather data
    def self.get_owm_data(city_id, api_key)
        #url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&units=imperial&APPID=#{api_key}" #in fahrenheit
        url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&units=metric&APPID=#{api_key}" #in celcius
        #url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&APPID=#{api_key}" #in kelvin
        resp = Net::HTTP.get_response(URI.parse(url))
        JSON.parse(resp.body)
    end
    def self.w_TEMP
        random_string_weather = rand(10000)
        city = IO.readlines(RAN.owmfile)[random_string_weather]
        api_owm = "4610a14e77ea7d2522ef38eed4bbee0c"
        output_weather = get_owm_data(city, api_owm)
        output_weather["main"]["temp"]
    end
    def self.y_STOCK
    output_stock = RAN.get_yql_data(RAN.s_SYMBOL)
    output_stock["query"]["results"]["quote"]["Ask"]
    end
    def self.y_STOCK2
    output_stock = RAN.get_yql_data(RAN.s_SYMBOL2)
    output_stock["query"]["results"]["quote"]["Ask"]
    end
    def self.number
        (RAN.y_STOCK.to_f*RAN.w_TEMP.to_f+1)*(RAN.s_SYMBOL2.to_f+1)
    end
    def self.num(rnNUM)
            tensecond_RN = RAN.number
    begin
            #puts tensecond_RN
            tensecond_RN /=10
    end while tensecond_RN > rnNUM
    tensecond_RN.abs
    end
end

#print random stock symbol
#puts RAN.s_SYMBOL

#print random temperature
#puts RAN.w_TEMP

#print random stock price
#puts RAN.y_STOCK
#puts RAN.y_STOCK2

#prints random stock * random temperature
#puts RAN.number

#prints a random number equal to or below the number in parentheses
#puts RAN.num(10)

#prints a random number equal to or below the number in parentheses rounded
#puts RAN.num(10).round