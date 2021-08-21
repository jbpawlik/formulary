# __Formulary One__

### by [James Benjamin Pawlik](http://github.com/jbpawlik)

![Formulary One](https://github.com/jbpawlik/specialty_foods/blob/main/app/assets/images/specialtyfoodsproducts-cropped.PNG?raw=true)

### __Description__
Formulary One is an API client that holds a database of prescription drug price tier information from a health insurance company. Users can create accounts, add their prescriptions to their profile, and search the database to determine whether their medication is covered and what price tier it is in.

### __Technologies Used__
Formulary One is written in Ruby on Rails. Authentication is handled with BCrypt and JSON web tokens. The database is managed by PostgresQL. Users may make HTTP requests in Postman or with cURL. The API is deployed on Heroku.

### __Setup/Installation__
Setup for this project assumes that you have Ruby installed on your personal computer. Ruby can be downloaded [here](https://www.ruby-lang.org/en/downloads/)
1. Download or clone the [repository](http://github.com/jbpawlik/formulary) to your local machine
2. Navigate to the top level of the directory
3. Open your terminal in this directory
4. Formulary One uses a database backup to store database information. To recreate the database, use the command "rake build[formulary]". The database can be seeded by running "rake db:seed". NOTE: By default, the site generates two users. The first user, admin@marios.com (password: "Admin2002!" has admin privileges and can make other users administrators.
5. To start the site, type "rails s". The site should open in your browser; if it does not, type localhost:3000 into your browser's address bar (if necessary, check the localhost path by reading the log displayed in the terminal after 'rails s')
6. To check the specifications, type "rspec". RSpec will run the logic specifications, then Capybara will run the integration specs. Testing logs are available in ./coverage.
7. When finished viewing the site, disconnect the server by navigating to the terminal window and typing ctrl-C

1. Run 'rails db:create'
2. rails g scaffold User email:uniq password:digest
3. rails db:migrate
4. uncomment bcrypt
5. Add to user.rb:
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
6. Add jwt gem
7. Create json_web_token.rb in lib directory
8. run 'rails s' in the console
9. To create a user, send a POST request to http://localhost:3000/users with an attached body (raw, JSON) containing this information:
{
  "user": {
    "email": "test@test.ca",
    "password": "1234"
  }
}
10. You will receive an authentication token back from the API. Copy this token
11. To see user details, send a GET request to http://localhost:3000/users; select Auth type: "Bearer Token" and enter your token in the field

Alternately, visit the [Heroku deployment](https://formulary-api.herokuapp.com)


# ___End Points___ #
The users and medications exist in a many-to-many relationship. A user can have multiple medications prescribed at one time, and a medication can be prescribed to many different users. 

If run using the 'rails s' command, these are the routes:

http://localhost:3000/  root GET '/' 'welcome#welcome'
A landing page that allows the user to sign up for an account and receive an authentication token. The user does not need authentication on this page or any dealing with signing up for or into an account.

http://localhost:3000   POST   /users(.:format)  users#create
This is the route that allows the user to create new users. Send a POST request to http://localhost:3000/users with an attached body (raw, JSON) containing this information: {"user": {"email": "test@test.ca", "password": "1234"}}.You will be given an authentication token. Copy the token and paste it into Postman under the Authorization -> Type -> Bearer Token section. This will allow you to access the guarded walls of the API.

http://localhost:3000/login_users  login_users POST   /users/login(.:format) users#login
You will need to supply an email address and password. Send a POST request to http://localhost:3000/users with an attached body (raw, JSON) containing similar information: {"user": {"email": "test@test.ca", "password": "1234"}}. 

http://localhost:3000/users  users GET    /users(.:format)  users#index
Allows the user to see a listing of other users. Users can see other users' names and email addresses (not a good feature for a production environment, obviously).

http://localhost:3000/users/:id  user GET /users/:id(.:format)  users#show  
Individual user page. Shows the user's prescriptions.

http://localhost:3000/users/:id PATCH  /users/:id(.:format)  users#update
Passing a new email and password will update the user.

http://localhost:3000/users/:id  PUT /users/:id(.:format)  users#update
Similar to Patch but Put replaces the original version of the resource, while Patch supplies instructions to modify the resource.

http://localhost:3000/users/:id  DELETE /users/:id(.:format) users#destroy
Sending a DELETE request here deletes the user. Users cannot delete other users if they do not have the login credentials.

http://localhost:3000 medications_random_search_medications GET    /medications/medications/random_search(.:format)  medications#random_search

http://localhost:3000
  medications GET    /medications(.:format)
medications#index

http://localhost:3000
              POST   /medications(.:format)
medications#create
http://localhost:3000
    medication GET    /medications/:id(.:format)
medications#show
http://localhost:3000

              PATCH  /medications/:id(.:format)
medications#update
http://localhost:3000

              PUT    /medications/:id(.:format)
medications#update
http://localhost:3000

              DELETE /medications/:id(.:format)
medications#destroy
http://localhost:3000



### __Known Bugs / Future Goals__
No bugs have been found or reported. Please contact the author if you experience poor performance.

Future goals for __Formulary One__:
1. Web portal to sign up and log in
2. Administrative backend

### __License__
This software is licensed under the [BSD license](license.txt).

[![License](https://img.shields.io/badge/License-BSD%202--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause)

Copyright (c) 2021 James Benjamin Pawlik

### __Contact Information__
Contact the author at __james.benjamin.pawlik@gmail.com__
