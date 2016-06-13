#Random number generator 

use 6500 random stock prices and 10000 random city temperatures. 
randomness between up to 1-100 is accurate but I have not implemented scaling beyond that yet. In a future release I will add up to a million unless someone requests otherwise.

#Requires:
Internet connection

#Installation: 
gem install ranNUM

#Class.functions

RAN.s_SYMBOL - random stock symbol from S&P500

RAN.s_SYMBOL2 - random stock symbol from list of 5900 stocks

RAN.w_TEMP - random temperature

RAN.y_STOCK - random stock price from S&P500

RAN.y_STOCK2 - random stock price from list of 5900 stocks

RAN.number - (random stock price * random temperature + 1) * (random stock price 2 + 1)

RAN.num(10) - a random number equal to or below the number in parentheses

#Future updates:

#Version 2.0+

-Add function to add personal Open Weather Maps API

-more accurate randomness, the possibility of 1 is still high - needs function to throw out nil

-higher random numbers up to a million


#version 3.0+

-use another type of source

 -CPU temperature
 
 -twitter
 
-change out rand function from ruby to more personal random number generator when picking

-improve general equation

