# -*- coding: utf-8 -*-
"""
Created on Sat Nov 30 12:31:40 2019

@author: kvissa
"""

class Utils:
    def to_inr(price):
        # First 3 letters is the country code, rest is price value
        print("from to_inr(): ", price)
        country_code = price[0:3]
        price = float(price[3:])
        
        conversion_rates = {'NPR' : 0.63,
                            '' : 0.0,
                            '' : 0.0,
                            '' : 0.0,
                            '' : 0.0,
                            '' : 0.0,
                            '' : 0.0,
                            }
        if country_code not in conversion_rates.keys():
            return 0.0
        
        return conversion_rates[country_code] * price
