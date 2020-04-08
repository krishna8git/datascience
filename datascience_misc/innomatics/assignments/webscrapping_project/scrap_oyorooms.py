# -*- coding: utf-8 -*-
"""
Created on Thu Nov 28 09:32:57 2019

@author: Krishna Kishore Vissa
"""

import os
import requests
import re
import csv
from bs4 import BeautifulSoup
from numpy import nan as NaN

os.chdir('C:/02_study/datascience/innomatics/assignments/webscrapping_project')
os.getcwd()

def get_oyo_hotel_info(country, city, hotel):
    row = {'Country' : country, 'Provider': 'OYO', 'City' : city }
    
    ###################### Hotel Info ###############################
    hotel_name = hotel.find('h3').text.strip()
    row['Hotel Name'] = hotel_name
    # print(f'{country} {city} {hotel_name}')
    address = hotel.find('span').text.strip()
    row['Address'] = address
    
    ###################### Ratings ################################
    ratings_wrapper =  hotel.find('div', class_='hotelRating__wrapper')
    if ratings_wrapper:
        ratings = re.search(r'(\d.\d)\s\((\d+)\sRatings\).(\w+)', ratings_wrapper.text)
        rating = ratings.group(1)
        n_ratings = ratings.group(2)
        rating_summary = ratings.group(3)
    else:
        rating = 'NEW'
        n_ratings = NaN
        rating_summary = NaN

    row['Rating'] = rating
    row['No Of Ratings'] = n_ratings
    row['Rating Summary'] = rating_summary
    
    ############## Amenities ##############################
    amenity_wrapper = hotel.find('div', class_='amenityWrapper')
    if amenity_wrapper:
        amenities = ', '.join(amenity.text.strip() for amenity in amenity_wrapper)
    else:
        amenities = NaN
    row['Amenities'] = amenities
    
    ############## Room type and Prices ######################
    room_type = hotel.find('div', class_='listingHotelDescription__HotelCategory').text.strip()
    
    if hotel.find('span', class_='listingHotelDescription__soldOut'):
        final_price = NaN
        slashed_price = NaN
        discount_percent_str = NaN
    else:        
        final_price = hotel.find('span', class_='listingPrice__finalPrice').text.strip()
        slashed_price = hotel.find('span', class_='listingPrice__slashedPrice d-body-lg')
        if slashed_price:
            slashed_price = slashed_price.text.strip()
        else:
            slashed_price = NaN
        
        discount_percent_str = hotel.find('span', class_='listingPrice__percentage')
        if discount_percent_str:
            discount_percent_str = discount_percent_str.text.strip()
        else:
            discount_percent_str = NaN
        
    row['Room Type'] = room_type
    row['Final Price'] = final_price
    row['Slashed Price'] = slashed_price
    row['Discount(%)'] = discount_percent_str
    
    global no_records
    no_records += 1
    return row
#    ############## Print All Values #######################
#    print("Hotel Name:", hotel_name)
#    print("Address:", address)
#    print("Rating:", float(rating))
#    print("No of Ratings:", int(n_ratings))
#    print("Ratings Summary:", rating_summary)
#    print("Amenities:", amenities)
#    print("Room Type:", room_type) 
#    print("Final Price: ", final_price.text)
#    print("Slashed Price:", slashed_price)    
#    print("Discount(%):", re.search(r'(\d\d)', discount_percent).group())
#    return row

def hotels_iter(country, city, hotels_soup):
    for hotel in hotels_soup:
        yield get_oyo_hotel_info(country, city, hotel)

def to_inr(price):
    # First 3 letters is the country code, rest is price value
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

countries = {
        'india' : 'India',
        'np' : 'Nepal',
        'my' : 'Malaysia',
        'id' : 'Indonesia',
        'ae' : 'UAE'
        }

base_url = 'https://www.oyorooms.com/'

country_cities = {}
count = 0

# Fetch all the URLs for all the Cities in all the countries
for ck, cv in countries.items():
    all_cities_url = base_url + ck + '/allcities/'
    all_cities_soup = BeautifulSoup(requests.get(all_cities_url).text, features = 'lxml')
#    print('URL = ', all_cities_url)
#    print(f"Fetching city urls for {cv}  ...", end = ' ')
    cities = [ (city.text, city.attrs['href']) for city in all_cities_soup.find_all('a', class_='c-kpzrw5') ]
#    print(f'Number of cities in {cv}: {len(cities)}')
#    print(cities)
    count += len(cities)
    country_cities[cv] = cities

for country, cities in country_cities.items():
    print(country)
    for city in cities:
        print('   ', city[0], ':', city[1] )

print(f"Total Number of cities: {count}\n")

def write_hotels_info_to_csv(url, csvwriter, country, city):
    '''Writes the hotels data to csv file. This method iterates over the hotel urls and fetches the 
    information.
    '''
    # print('Fetching contents of the URL:', url)
    data_soup = BeautifulSoup(requests.get(url).text, features = 'lxml')
    hotels_class_name = 'oyo-row oyo-row--no-spacing listingHotelDescription'
    hotels_soup = data_soup.find_all('div', class_=hotels_class_name)
    csvwriter.writerows([ hotel for hotel in hotels_iter(country, city, hotels_soup)])

############### Open CSV File in Write mode and prepare the CSV Header ####################
output_csv = open('oyo_hotels_final.csv', 'w', newline='', encoding='utf-8')
columns = ['Country', 'Provider', 'City', 'Hotel Name', 'Address', 'Rating', 'No Of Ratings',
           'Rating Summary', 'Amenities', 'Room Type', 'Final Price', 'Slashed Price', 'Discount(%)']

# prepare the header
csvwriter = csv.DictWriter(output_csv, fieldnames = columns)
csvwriter.writeheader()

# Fetches the complete data country and city wise 
completed = 0
no_records = 0

for country, cities in country_cities.items():
    print(f'\nFetching {country} Hotels . ', end='')
    citycount = 0
    for city_url in country_cities[country]:
        city_base_url = base_url
        
        match = re.search(r'/india/(.+\b)', city_url[1])
        if match:
            city_base_url += match.group(1)
        else:
            city_base_url += city_url[1]
        # print(city_base_url)
        # try:
        page_soup = BeautifulSoup(requests.get(city_base_url).text, features = 'lxml')
        hotels_soup = page_soup.find_all('div', 
                                         class_='oyo-row oyo-row--no-spacing listingHotelDescription')
        csvwriter.writerows([ hotel for hotel in hotels_iter(country, city_url[0], hotels_soup)])
        pages = page_soup.find_all('a', class_='link ListingPagination__pageContainer--page')
        if pages:
            for page in pages:
                page_url = base_url + page.attrs['href']
                # print("Page URL: ", page_url)
                write_hotels_info_to_csv(page_url, csvwriter, country, city_url[0])
                print('.', end=' ')
        citycount += 1
        completed += 1
        # except:
        #   print(f'\nIgnoring the url {city_base_url} since maximum retry attempts failed.')
        #   pass
    print(f'City Count in {country}: {citycount}')
    print(f'\nFinished {int(completed / count * 100)}%')
    

print(f'\nSuccessfully fetched {no_records} records.')

#output_csv = open('sample_hotels.csv', "w", newline='', encoding="utf-8")
#columns = ['Country', 'Provider', 'City', 'Hotel Name', 'Address', 'Rating', 'No Of Ratings',
#           'Rating Summary', 'Amenities', 'Room Type', 'Final Price', 'Slashed Price', 'Discount(%)']
## prepare the header
#csvwriter = csv.DictWriter(output_csv, fieldnames = columns)
#csvwriter.writeheader()
#
#write_hotels_info_to_csv('https://www.oyorooms.com//ae/hotels-in-dubai/?page=2', csvwriter, 'nepal', 'pok')

output_csv.close()
