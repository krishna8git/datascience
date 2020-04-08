# -*- coding: utf-8 -*-
"""
Created on Wed Dec 11 22:20:57 2019

@author: kvissa
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


############### Open CSV File in Write mode and prepare the CSV Header ####################
output_csv = open('oyo_hotels_sample.csv', 'w', newline='', encoding='utf-8')
columns = ['Country', 'Provider', 'City', 'Hotel Name', 'Address', 'Rating', 'No Of Ratings',
           'Rating Summary', 'Amenities', 'Room Type', 'Final Price', 'Slashed Price', 'Discount(%)']


# prepare the header
csvwriter = csv.DictWriter(output_csv, fieldnames = columns)
csvwriter.writeheader()

data_soup = BeautifulSoup(requests.get('https://www.oyorooms.com/np/hotels-in-surkhet/').text, features = 'lxml')
hotels_class_name = 'oyo-row oyo-row--no-spacing listingHotelDescription'
hotels_soup = data_soup.find_all('div', class_=hotels_class_name)
csvwriter.writerows([ hotel for hotel in hotels_iter('Nepal', 'Surhera', hotels_soup)])

output_csv.close()
print('Completed')
