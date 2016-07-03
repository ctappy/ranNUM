Random number generator 
=============

Uses 6500 random stock prices and 10000 random city temperatures.

Usage
-----

```ruby
require 'ranNUM'
```

Requires:
-----
Internet connection

Installation: 
-----
```
gem install ranNUM
```
Class.functions
-----

```
RAN.s_SYMBOL - random stock symbol from S&P500
RAN.s_SYMBOL2 - random stock symbol from list of 5900 stocks
RAN.w_TEMP - random temperature
RAN.y_STOCK - random stock price from S&P500
RAN.y_STOCK2 - random stock price from list of 5900 stocks
RAN.number - (random number * random stock price * random temperature + 1) * (random number * random stock price * random temperature + 1)

RAN.num(10) - a random number equal to or below the number in parentheses
```

Flags
-----

* "-o", "--owmapi", Adds Open Weather API for example "ruby ranNUM.rb -o 'API'"
* "-h", "--help", Displays help page

Gem
-----

Add Open Weather Maps API to gem
```
ruby ~/.gem/ruby/{version}/gems/ranNUM-{version}/lib/ranNUM.rb -o 'api'
```
or

echo 'api' > ~/.gem/ruby/{version}/gems/ranNUM-{version}/lib/textfiles/owmapi.txt
Future updates:
-----

Version 2.0+
-----

* higher random numbers up to a million


version 3.0+
-----

* use another type of source
* CPU temperature
* twitter
* change out rand function from ruby
* improve general equation

