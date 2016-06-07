require 'json'
require 'net/http'

#function to grab stock from yahoo finance api
def get_yql_data(ticker)
  url = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%3D%22#{ ticker }%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
  resp = Net::HTTP.get_response(URI.parse(url))
  result = JSON.parse(resp.body)
  return result
end

#function to grab temperature from openweathermap api
def get_owm_data(city_id, api_key)
    url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&APPID=#{api_key}"
    resp = Net::HTTP.get_response(URI.parse(url))
    result = JSON.parse(resp.body)
    return result
end
#city = "524901"
#city = "#{rand(1000000)}"

#read file owmid.txt and pick random temperature using function get_owm_data
random_string_weather = rand(10000)
city = IO.readlines("owmid.txt")[random_string_weather]
api_owm = "4610a14e77ea7d2522ef38eed4bbee0c"
output_weather = get_owm_data(city, api_owm)
weather_num = output_weather["main"]["temp"]

#read file SP500 and pick random stock using function get_yql_data
random_string_stocks = rand(500)
stock_id = IO.readlines("SP500.txt")[random_string_stocks]
output_stock = get_yql_data(stock_id)
stock_num = output_stock["query"]["results"]["quote"]["Ask"]

#output curent data
puts  "#{weather_num} random weather temperature in kelvin"
puts "#{stock_num} random stock price"

#multiply temperature and stock and add 1 for safe measure in case temperature or stock is 0 or nil
ran_NUM = weather_num.to_f*stock_num.to_f+1

#convert string to integer and round
$ran_NUM = ran_NUM.to_f.round

#max number ranNUM can pick
$ranNUMSET = 30

#create random number lower than $ranNUMSET
until $ran_NUM < $ranNUMSET do
    $ran_NUM /=11;
    ranNUM = $ran_NUM
end

class RanNUM
    def self.rNUM
        $ranNUM
    end
end

#results
puts "this number #{ranNUM}"
puts "this number #{ran_NUM}"
puts RanNUM.rNUM
