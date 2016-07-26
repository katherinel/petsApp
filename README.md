A simple Rails app that allows you to sign up, log in, create a pet with a name, age, gender, species, and image file. [View the demo on Heroku](https://immense-hollows-85513.herokuapp.com)

###About the stack:
- User registration is handled by Devise.
- Image uploading and processing is handled by Carrierwave + Minimagick.
- I used Bootstrap for the layouts, written in Sass & Haml. The layout is responsive and should look fairly decent on mobile.
- Model tests using Minitest.

###About the app:
- The main model, Pet, has a belongs_to relationship to gender, user, and species. Gender could have potentially been stored as hardcoded values, since it’s not really necessary to create an entire table for something that is safe to assume will only ever contain three rows, but the way I did it works too.
- User_id is stored on the pet, so that only the user that created the pet can edit or delete it.
- There are db seeds to create genders and species.

###What was challenging:
- Fiddly CSS things. It took longer than I care to admit to get the datepicker working properly (it was passing the date in the wrong format), and it came down to one silly little change in the view.
- Similarly, formatting everything into bootstrap and getting it to look nice took a while, since I’m used to writing my own CSS. I guess it wasn’t challenging, just more time consuming than I predicted. Besides those things, the rest was fairly straightforward!

###What I would improve:
- Currently user uploaded images do not persist because they are uploading to Heroku, and Heroku wipes them out. If this were a real app I’d use the fog gem to host on AWS (as I did [here](https://github.com/katherinel/katherineleippercom/blob/10d2950667f0b95d4e274716dd030e864522fbf6/config/initializers/carrierwave.rb)), but for security reasons, I’m not going to do that right now.
- More tests, more robust testing framework: I wrote the most basic of tests, but ideally I’d want to test logins and uploads, maybe use RSpec, and also write some behavior tests, perhaps with Cucumber.
- Little features that would make all the difference: A user profile page, a forgotten password link, ability to change password.
- The views could be more exciting, but I decided to restrain myself and not turn this into a full-blown design project. Bootstrap is a good start, but before going too much further, a front end framework like React would be good to add so that some Javascript could be added to spice things up.
- Error messages: default rails ones are ugly!

###Even more:
- What if you wanted to add more than one image? An images model would need to be added, with a pet_id column. When creating a pet for the first time, if the user is allowed to also upload images at the same time, this presents a challenge, since the pet record is new, and we have no way of knowing what pet_id the image should have. We could save the pet record as a “draft” state without validating, and once the images are added, “publish” it. This would create some loose, unpublished records in our database, but a background job could erase them every so often.
- What if multiple people owned the same pet? We’d need a has_and_belongs_to_many relationship between pets and users, and a table linking the ids together.