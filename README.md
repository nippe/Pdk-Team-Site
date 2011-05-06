### About a
This is an attempt at creating a site for a sports team where the team members can log in and:
* Read and post on a wall
* See upcoming events (games, workouts, ...)
* RVSP on upcoming events (games, workouts, ...)
* Dispaly a members list with contact info and player info


### Dependencies
* It's a rails 3 app and therefore dependent on Ruby 1.9.2
* AuthLogic for authentication - https://github.com/binarylogic/authlogic
* jquery-rails for registering jQuery instead of Prototype - original location: https://github.com/indirect/jquery-rails but I use a patched version hwo worked on my machine: https://github.com/pgericson/jquery-rails
* acl9 for roles support, https://github.com/be9/acl9


### Installation

#### Clone the repository

        git clone git@github.com:nippe/Pdk-Team-Site.git

#### cd into the created dir
        cd Pdk-Team-Site

#### Install bundle
        bundle install

#### Run migrations
        rake db:migrate

#### Start server
        rails server

#### Create a user
This will be baked into a migration later on, but for now its manual. Hit the site and register a user. Start the rails consloe and do the following:
        > rails console
        > user = User.first
        > user.noshow = ""
        > user.approved=true
        > user.save
        > user.has_role! :admin




### Disclamer
This is my first ever Ruby and Rails project so things might be totally wrong... Please tell me if you catch something

Some things will be hardcode in Swedish until we/I get to the localization part (which in time of writing is far ahead)
