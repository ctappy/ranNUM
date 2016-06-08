require 'json'
require 'net/http'

class NUM
#get stock data
  def self.get_yql_data(ticker)
        url = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%3D%22#{ ticker }%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    resp = Net::HTTP.get_response(URI.parse(url))
    JSON.parse(resp.body)
  end
    def self.s_SYMBOL
    random_string_stocks = rand(500)
    IO.readlines("SP500.txt")[random_string_stocks]
    end
#get weather data
    def self.get_owm_data(city_id, api_key)
        url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&APPID=#{api_key}"
        resp = Net::HTTP.get_response(URI.parse(url))
        JSON.parse(resp.body)
    end
    def self.w_SYMBOL
        random_string_weather = rand(10000)
        city = IO.readlines("owmid.txt")[random_string_weather]
        api_owm = "4610a14e77ea7d2522ef38eed4bbee0c"
        output_weather = get_owm_data(city, api_owm)
        output_weather["main"]["temp"]
    end
end

#read file SP500 and pick random stock using function get_yql_data
class RAN
    def self.y_STOCK
    output_stock = NUM.get_yql_data(NUM.s_SYMBOL)
    output_stock["query"]["results"]["quote"]["Ask"]
    end
    def self.num
        RAN.y_STOCK.to_f*NUM.w_SYMBOL.to_f+1
        #randomnumber.round
    end
    #need to fix code above to add below

end
puts NUM.s_SYMBOL
puts NUM.w_SYMBOL
puts NUM.w_SYMBOL
puts RAN.y_STOCK
puts RAN.y_STOCK
puts RAN.num
