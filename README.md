# __Formulary One__

### by [James Benjamin Pawlik](http://github.com/jbpawlik)

![Mario's Fine Foods](https://github.com/jbpawlik/specialty_foods/blob/main/app/assets/images/specialtyfoodsproducts-cropped.PNG?raw=true)

### __Description__
Mario's Fine Foods is a proof-of-concept website for an independent grocery store. Users can sign up for the site or log in as an administrator. A user can browse products and add reviews, while an administrator can add and edit products and reviews.

### __Technologies Used__
Mario's Fine Foods was written in Ruby on Rails. Debugging was handled by Pry and Byebug. Testing was done with RSpec, Capybara, and Simplecov. Page content is written as embedded Ruby/HTML, with styling from CSS. The database is managed with Postgres and seeded with Faker. Authorization and authentication handled by BCrypt, Rails Admin, and CanCanCan. 

### __Setup/Installation__
Setup for this project assumes that you have Ruby installed on your personal computer. Ruby can be downloaded [here](https://www.ruby-lang.org/en/downloads/)
1. Download or clone the [repository](http://github.com/jbpawlik/specialty_foods) to your local machine
2. Navigate to the top level of the directory
3. Open your terminal in this directory
4. Mario's Fine Foods uses a database backup to store database information. To recreate the database, use the command "rake build[specialty_foods]". The database can be seeded by running "rake db:seed". NOTE: By default, the site generates two users. The first user, admin@marios.com (password: "Admin2002!" has admin privileges and can make other users administrators.
5. To start the site, type "rails s". The site should open in your browser; if it does not, type localhost:3000 into your browser's address bar (if necessary, check the localhost path by reading the log displayed in the terminal after 'rails s')
6. To check the specifications, type "rspec". RSpec will run the logic specifications, then Capybara will run the integration specs. Testing logs are available in ./coverage.
7. When finished viewing the site, disconnect the server by navigating to the terminal window and typing ctrl-C

1. Run 'rails db:create'
2. rails g scaffold User email:uniq password:digest
3. rails db:migrate

Alternately, visit the [Heroku deployment](https://marios-fine-foods.herokuapp.com)

### __Known Bugs / Future Goals__
No bugs have been found or reported. Please contact the author if you experience poor performance.

Future goals for __Mario's Fine Foods__:
1. Allow users to log in with authentication
2. Separate entrances for users and administrators

### __License__
This software is licensed under the [BSD license](license.txt).

[![License](https://img.shields.io/badge/License-BSD%202--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause)

Copyright (c) 2021 James Benjamin Pawlik

### __Contact Information__
Contact the author at __james.benjamin.pawlik@gmail.com__
