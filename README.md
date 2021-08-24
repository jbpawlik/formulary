# __Formulary One__

### by [James Benjamin Pawlik](http://github.com/jbpawlik)

![Formulary One](https://github.com/jbpawlik/formulary/blob/main/app/assets/images/pills.jpg?raw=true)

### __Description__
Formulary One is an API client that hosts a database of prescription drug information allowing users to query the API to find health insurance coverage and co-payment tiers. A user can create secure accounts, add their medications, and generate a virtual prescription.

### __Technologies Used__
Formulary One is written in Ruby on Rails. Authentication is handled with BCrypt and JSON Web Tokens (JWT). The database is managed by PostgresQL. HTTP testing done in Postman or with cURL. The API is deployed on Heroku.

### __Setup/Installation__
Setup for this project assumes that you have Ruby installed on your personal computer. Ruby can be downloaded [here](https://www.ruby-lang.org/en/downloads/)
1. Download or clone the [repository](http://github.com/jbpawlik/formulary) to your local machine
2. Navigate to the top level of the directory
3. Open your terminal in this directory
4. Formulary One is built around a database. For demonstration purposes, the database can be seeded by running "rake db:create" and "rake db:seed". Running "rake db:reset" will clear your old database to seed a new one.
5. To start the site, type "rails s". The site should open in your browser; if it does not, type localhost:3000 into your browser's address bar (if necessary, check the localhost path by reading the log displayed in the terminal after 'rails s')
6. The API's endpoints can be accessed by sending HTTP requests. Use Postman to format and send requests (read the End Points section for more)
7. To create a user, send a POST request to http://localhost:3000/users with an attached body (raw, JSON) containing an email and password in this format: { "user": { "email": "test@test.ca", "password": "1234 }}
8. You will receive an authentication token back from the API. Copy this token and/or write it down for safekeeping.
9. To see user details, send a GET request to http://localhost:3000/users; select Auth type: "Bearer Token" and enter your token in the field. From now on, while you are logged in, you will be able to access all of the site's pages.
10. To check the specifications, type "rspec". RSpec will run the logic specifications, then Capybara will run the integration specs. Testing logs are available in ./coverage.
11. When finished viewing the site, disconnect the server by navigating to the terminal window and typing ctrl-C

Alternately, visit the [Heroku deployment](https://formulary-api.herokuapp.com). Postman queries can be made by using https://formulary-api.herokuapp.com in place of the http://localhost:3000

# __End Points__ #
Users and Medications exist in a many-to-many relationship. A User can have multiple Medications prescribed at one time, and a Medication can be prescribed to many different Users.

If using the 'rails s' command, these are the routes:

http://localhost:3000/  root GET '/' 'welcome#welcome'
A landing page for browser users that allows the user to sign up for an account and receive an authentication token. The user does not need authentication on this page (or any dealing with signing up for or into an account).

http://localhost:3000/users   POST   /users(.:format)  users#create
This is the route that allows the user to create new users. Send a POST request to http://localhost:3000/users with an attached body (raw, JSON) containing user information formatted this way: {"user": {"email": "test@test.ca", "password": "1234"}}.You will be given an authentication token. Copy the token and paste it into Postman under the Authorization -> Type -> Bearer Token section. This will allow you to access the API database.

http://localhost:3000/login_users  login_users POST /users/login(.:format) users#login
You will need to supply an email address and password. Send a POST request to http://localhost:3000/users with an attached body (raw, JSON) containing your user information: {"user": {"email": "test@test.ca", "password": "1234"}}.

http://localhost:3000/users  users GET  /users(.:format)  users#index
Allows the user to see a listing of other users.

http://localhost:3000/users/:id  user GET /users/:id(.:format)  users#show
Individual user page. Shows the user's prescriptions.

http://localhost:3000/users/:id PATCH  /users/:id(.:format)  users#update
Passing a new email and password will update the user.

http://localhost:3000/users/:id  PUT /users/:id(.:format)  users#update
Similar to Patch but replaces the original version of the resource; Patch supplies instructions to modify the resource.

http://localhost:3000/users/:id  DELETE /users/:id(.:format) users#destroy
Sending a DELETE request here deletes the user. The user login credentials must be send with the request.

The Medication class also has full REST functionality.  The routes are listed below:
http://localhost:3000  medications GET /medications(.:format) medications#index
http://localhost:3000  POST /medications(.:format)  medications#create
http://localhost:3000  medication GET /medications/:id(.:format)medications#show
http://localhost:3000  PATCH /medications/:id(.:format) medications#update
http://localhost:3000  PUT /medications/:id(.:format) medications#update
http://localhost:3000  DELETE /medications/:id(.:format) medications#destroy

In addition, Medication also has a random medication feature:

http://localhost:3000/random_search GET /medications/random_search(.:format)  medications#random_search

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
