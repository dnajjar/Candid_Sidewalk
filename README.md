# Candid_Sidewalk

Candid Sidewalk is a Rails app that allows users to report hazardous sidewalks to their local councilperson in one click of their smart phone.  

Its responsive design works across platforms (Android, iPhone, and Desktop browser) to capture a photograph with geolocation metadata and email the photo with its address to the Councilperson who represents that area.  

##Features

- Uploads and stores images using CarrierWave and Amazon S3
- On-site geolocation added to report using JavaScript when filling out report form
- Google Civic Information API (accessed through CivicAide gem) returns local government official names and contact information based on address
- ActionMailer emails local representative with report complaint and image
- Google Maps API visualizes all reports in the area
- Map and report filing are open to the public, but authenticated users have an extra benefit of tracking their reports on their account 

##Dependencies

**Gems**  
  
- civic_aide  
- carrierwave  
- fog-aws  
- google-api-client  
- geocoder  

##Authors

Dana Najjar, Julian Taub, and Joshua Baker, in May-June 2015  

##Credit

Our instructor Steven Nunez for his support. James Tyack of [UnlockPhilly](http://www.unlockphilly.com/) for inspiration.  

##Lincense

Candid Sidewalk is MIT Licensed. See LICENSE for details.  