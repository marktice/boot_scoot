# Boot Scoot
https://bootscoot.herokuapp.com/

## Concept
### The Problem
You drive your car to an event, party, dinner and you have a few alcoholic drinks. Now at the end of the night you need to go home but you're not in a state to drive. What are your options? 
Currently if you don't have a designated driver willing to drive you and your car home your only option is to get a cab/uber home. But then your car is still where you left it so you must come back later to retrieve it.

**The Solution**

Hire your personal designated driver to come to your location and drive you AND your car home. 
They come to you quickly on a small form of transport which will fit in your car boot. Drive you and your car home, then leave on their form of transport.  

### Driver Transport
How does the driver get to you and then leave the drop-off location?

**Solution**: The driver will have a form of transport that fits in your boot. As long as it's below certain dimensions which will fit into the car.

#### Transport Options:
- foldable scooter

![scoot](app/assets/images/stock/folded-unfolded-scooter.jpg)

- foldable bike 
- electric skateboard
- hoverboard
- segway

### Target Markets
#### Passengers
Students/business workers/sick
Events: 
- sporting
- festivals
- concerts
- airports

#### Drivers
- Students
- People in-between jobs
- delivery drivers (uber eats, couriers etc)

---

## Planning
### Trello
[Trello Board - Boot Scoot](https://trello.com/b/g33pMsuZ/boot-scoot#)

![trello](app/assets/images/readme/trello1.png)

![trello](app/assets/images/readme/trello2.png)

My trello board is the main driver of my project management. It allowed me to plan ahead with User Stories, Models, Controllers, ERD and Wireframes. I also used it to determine the potential APIs that I am going to use as well as the gems that I need to build my rails project.

The trello board later turned into an Agile scrum board in which I managed my project to organise my Backlog, Active tasks, Tasks that are ready to be tested and the Tasks I already completed. Using Agile in this project is a very fruitful decision which leads to the proper timeboxing of my tasks.

### User Stories
My user stories are composed of 3 target markets (Guests, Buyers and Sellers). Guests are the people who have not signed up for the app and are potential customers for the two-sided marketplace. Buyers and Sellers are the registered users who can benefit from all the features of the site. Also, since it is a two-sided marketplace, a buyer can be a seller and a seller can be a buyer.

#### Guest
- As a guest, i want to see all the details of the service, so that i can decide if i'd like to sign up.
#### Passengers
Top level stories:
- As a passenger, i want to get a driver quickly, so that i don't have to wait too long.
- As passenger, I want to know when the driver will come, So I know when to leave and don’t have to wait by car.
- As a female passenger, i want to be able to select only female drivers, so i feel safe.

Passenger Persona: 
- Steve Stifler
  - 21 yrs old
  - Student, party animal
  - Driven car to a party with art students
  - Had waaaaaay to much to drink
  - Needs to get home but can’t drive and doesn’t want to leave car there

- As Steve, I want a driver in a reasonable time, So I don’t pass out.
- As Steve, I want a simple interface, So its easy to use when drunk.

Passenger Persona:
- Sally
  - 32 yrs old
  - Works in the city, 9-5 Mon-Fri
  - Had a few too many after work, wants to get home with his car so he can drive to work tomorrow

Sally's Stories
- As a professional, i want to know i will be covered in case of an accident, for peace of mind.
- As a professional, i want to know that i will have a safe registered driver, so that i can trust the service.

#### Drivers
- As a driver, I want to know where to know exactly where to pickup and drive the customer, so that I can complete the booking easily.
- As driver, I want to be able to see customer details, so i know who i'm picking up and what car i'm driving
- As a driver, i want to be assured i can fit the scooter in their boot, so i can complete the trip.
- As a driver, i want all payments to be made through the app, so i don't have to worry about getting paid.
- As a driver, i want to be assured payed according to the trip distance and time taken, so i get value for my time.
- As a driver, i want to be able to see my history of trips and payments, so i can see how much i have made.
- As a driver, i want to be covered in case of an accident, so that i don't lose money.
- As a driver, i want to be able to report something if it goes wrong, so that the problem can be attended to.

Driver Persona:
- Johnny
  - 20 yrs old
  - Student
  - Broke
  - Has a foldable bike
  - I need a job which is flexible around my classes and study schedule
  - I don’t own a car so can’t drive for uber
  - Need to be payed for any work instantly

Johnny's Stories
- As Johnny, i want to be payed instantly, so that i can pay my bills(im broke).
- As Johnny, i want to be able to select max distance from my home, so that i'm not too far away since i only have a foldable bike.


### User Journeys
*picture of workflow diagram*


### ERD
The ERD is the most critical part of my design and is essentially one of the biggest things I have done for my project. Planning my tables ahead gave me an idea of how I want to work with my Rails models. 

![ERD](/app/assets/images/readme/db.png)

### Wireframes
[Figma - Boot Scoot](https://www.figma.com/file/V70gzh77WVl7rG0sr5S4MbVj/Boot-Scoot)

From the user stories a simply interface was required for the potentially inebriated passengers.

![Figma](/app/assets/images/readme/figma.png)


---

## Development

### Features
- Devise Security and Pundit authorizations
- Image uploading and processing of different sized images
- Autocomplete of addresses

![Contact](/app/assets/images/readme/autocomplete.png)

- Geocoding of addresses latitude and longitude
- Custom styled maps, made with a simplified minimal approach and color palette
- Map with origin and destination shown with a desired driving route

![Contact](/app/assets/images/readme/route.png)

- Bookings available map for drivers, geolocating the driver and showing pickup locations nearby. 

![Contact](/app/assets/images/readme/bookings.png)

- Trip directions panel for the driver
- Estimated time and calculated distance

![Contact](/app/assets/images/readme/directions.png)

- Trip cost calculated from these values
- Order Confirmation and credit card payments with stripe

![Contact](/app/assets/images/readme/stripe.png)

- Reviews from both passenger and driver in relation to other user including a rating out of 5 and an optional comment

![Contact](/app/assets/images/readme/review.png)

- Redirect to contact form if rating of < 3 stars
- Contact email form with list of all past bookings and reason for contact

![Contact](/app/assets/images/readme/contact.png)

- Each user have a rating shown to users for each role to motivate users to do a good job and be respectful to others 
- Past trips list for passenger bookings and or driver bookings

![Past bookings](/app/assets/images/readme/past-bookings.png)

- and many more!

### Gems
```
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'geocoder', '~> 1.4', '>= 1.4.7'
gem 'shrine', '~> 2.11'
gem "image_processing", "~> 1.0"
gem 'mailgun-ruby', '~> 1.1', '>= 1.1.9'
gem 'stripe', '~> 3.13'
gem 'pundit', '~> 1.1'
gem 'pry'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'
```
```
gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
gem 'dotenv-rails', '~> 2.3'
gem 'rspec-rails', '~> 3.7'
gem 'capybara', '~> 2.13'
gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
```

### APIs
To achieve all the functionality i used many different apis from google. 
- Google Maps JavaScript API
  - geocoding
    - for attaining latitude and logitude of a given address
  - directions
    - for displaying the bookings path, car directions, distance and estimated time
  - places and autocomplete
    - for entering address fields
  - geolocation
    - for finding driver location and displaying trips nearby

### Challenges

---

## Finished Product