# BOOT SCOOT

## Concept
### The Problem
You drive your car to an event, party, dinner and you have a few alcoholic drinks. Now at the end of the night you need to go home but you're not in a state to drive. What are your options? 
Currently if you don't have a designated driver willing to drive you and your car home your only option is to get a cab/uber home. But then your car is still where you left it so you must come back later to retrieve it.

**The Solution**

Hire your personal designated driver to come to your location and drive you AND your car home. 
They come to you quickly on a small form of transport which will fit in your car boot. Drive you and your car home, then leave on their form of transport.  

### Driver Transport
How does the driver get to you and then leave the drop-off location?

**Solution**: The driver will have a form of transport that fits in your boot. As long as it's below certain dimensions which will fit into the car.(need to measure this)

#### Transport Options:
- foldable scooter
![scoot](https://inhabitat.com/wp-content/blogs.dir/1/files/2014/11/Mini-Citysurfer-Folding-Electric-Scooter-2.jpg)
- foldable bike 
![bike](https://cdn1.psfk.com/wp-content/uploads/2017/09/burke20-suitcase.jpg)
- electric skateboard
![skateboard](https://hoverboardstore.com.au/wp-content/uploads/2017/11/1-8b51ZrIQ8cUejXrGNNG8Qg-Copy-924x784.jpeg)
- hoverboard
![hoverboard](https://i.pinimg.com/564x/4d/9a/21/4d9a2167f73cdf2244638e68c3b76b93.jpg)
- segway
![segway](http://psipunk.com/wp-content/uploads/2009/08/orbis-segway-like-compact-foldable-vehicle-04.jpg)

### Matching driver and passenger
How to match users so that both are happy. Let the driver pick trip or match them ourselves?

#### Match making algorithm
- driver distance to pickup(origin)
- in driver profile can select drop-off(destination) max distance from their home
- if female passenger they can select only female drivers

```
Logged in drivers
order by shortest distance from driver to pickup(origin)
check: if passenger[:sex] == female, find driver[:sex] == female
check: distance from driver[:home] to destination < driver[:max_distance]
```

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
*PICTURE OF TRELLO HERE*
*DISCUSSION ON HOW GOOD TRELLO IS*

### User Stories
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
*picture of ERD diagram*


### Wireframes
*picture of figma wireframes*

---

## Development

### Gems


### APIs
- Google Maps API
  - directions
  - map
  - autocomplete/places
  - geolocation
  - geocoding

### Challenges

---

## Production
### Deployment

### Finished Product