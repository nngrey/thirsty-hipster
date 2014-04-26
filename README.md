The Thirsty Hipster App
======================

Summary
--------
Thisty Hipster is a location-based virtual rendering service that accesses a proprietary estimation algorithm to determine ideal happy hour locations.

User Stories
-----------
* As a thirsty hipster, I want to find an obscure locally-brewed DoppleBock after a long day of rolling cigarettes and listening to vinyl.





########################
Useful Docs
########################

https://medium.com/wdi-nyc-jan-2014/1e286c83e72e
http://www.yelp.com/developers/documentation/v2/overview


**UI for Adding a New Establishment to Thirsty Hipster's Database**

1.  visit root_path
2.  click "add location"
3.  render new_search_path (and form)
4.  user enters name, clicks "Search Yelp" button
5.  search w/ yelp_check using new search object
6.  yelp_check run on the name entered, first 5 results are displayed on the page with name and address
7.  user selects correct result
8.  new_location_path, with "new" form displayed, with name, address, and URL pre-populated
9.  user enters happy hour start and end times and description
10.  click "create location"
11.  redirect_to location_path(@location)
