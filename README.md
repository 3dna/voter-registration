##NOTE:
This is NationBuilder's "Engine" branch of this voter registration app. You can install this as a plugin to any Rails 3+ application.

Here's how:

1.  Add to your Gemfile:

        gem 'voter_registration', :git => 'https://github.com/3dna/voter-registration.git'
    
    Then 'bundle install'

2.  Install the migrations:

        rake voter:install:migrations

    Then of course run:

        rake db:migrate

3.  Modify your routes file to mount the engine:

        MyApp::Application.routes.draw do
          mount VoterRegistration::Engine => "/register"
        end

4.  Bootstrap the database with required data. Run:

        rake load_voter_registration:all

That should be it! On with the original instructions (NOT updated for the engine version, but kept here for completeness)

#Voter Registration

##About

We need more Americans to have a say in their government, not just the special interests. That's why we should be taking down roadblocks to voting.  We believe in an America where everybody can make their voices heard.

That is why the Democratic National Committee created this open source application to provide more opportunities to register to vote in November!  States have varying laws for voter registration, so this application is a one stop shop that contains all the voter registration information and voting checklists that you will need to vote. **This information should not be altered.**

You can help all eligible voters register to vote by using this software.

# What is it?

A Ruby on Rails Application that generates a [National Voter Registration Form](http://www.eac.gov/voter_resources/register_to_vote.aspx) PDF from a webform.
Includes the guidelines for the National Voter Registration form in all states.

## Demo
You can see a running version of the application at [http://voter-registration.herokuapp.com/](http://voter-registration.herokuapp.com/)

## Requirements
1.  Make sure the machine that you're using has Ruby 1.9.3 installed.
    We use [rbenv](https://github.com/sstephenson/rbenv/) for Ruby version management
2.  You'll need the RubyGem "bundler" installed.

## Installation

    git clone git@github.com:ofa/voter-registration.git
    cd voter-registration
    bundle install
    rake db:migrate
    rake db:seed #This will load all the State information

## Usage
    rails server

Open up your browser and go to http://localhost:3000

## Deploying to [Heroku](http://www.heroku.com)
You can setup a Heroku account for free [https://devcenter.heroku.com/articles/quickstart](https://devcenter.heroku.com/articles/quickstart)

    heroku create
    heroku addons:add sendgrid:starter #Free addon used for devise emails
    git push heroku master
    heroku run rake db:migrate
    heroku run rake db:seed

## Running Tests

We use RSpec for tests: `bundle exec rake spec`

## Admin the pages
We use [rails_admin](https://www.github.com/sferik/rails_admin) to manage the State Guidelines
Go to "/admin" to login and manage the Guidelines

The default email: admin@example.com    
The default password: p@ssw0rd   

## Supported Ruby Versions
This application aims to support and is tested against the following Ruby
implementations:

* Ruby 1.9.2
* Ruby 1.9.3

## Contributing
In the spirit of [free software][free-sw], **everyone** is encouraged to help
improve this project.

[free-sw]: http://www.fsf.org/licensing/essays/free-sw.html

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by [translating to a new language][locales]
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up
  inconsistent whitespace)
* by refactoring code
* by closing [issues][]
* by reviewing patches

[locales]: https://github.com/democrats/voter-registration/tree/master/config/locales
[issues]: https://github.com/democrats/voter-registration/issues

## Submitting an Issue
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. You can indicate support for an existing issue by
voting it up. When submitting a bug report, please include a [Gist][] that
includes a stack trace and any details that may be necessary to reproduce the
bug, including your gem version, Ruby version, and operating system. Ideally, a
bug report should include a pull request with failing specs.

[gist]: https://gist.github.com/

## Submitting a Pull Request
1. Fork the project.
2. Create a topic branch. (`git checkout -b my_awesome_branch`)
3. Implement your feature or bug fix.
4. Add tests for your feature or bug fix.
5. Run `bundle exec rake spec`. If your changes are not 100% covered, go back
   to step 4.
6. Commit your changes. (`git commit -am "Added some cool things"`)
7. Push to the branch (`git push origin my_awesome_branch`)
8. Submit a [pull request](https://help.github.com/articles/using-pull-requests/)

## Documentation

Documentation is available in the **/doc** directory in the root of the project.

## License

Copyright © 2012 DNC Services Corporation
http://www.democrats.org/

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

This permission does not include: (a) any use of the Software other than for its intended purpose; or (b) any use of the Software in any manner that violates applicable law.  Any use of the Software other than as specifically authorized herein is strictly prohibited and will terminate the license granted herein.

All information, dates and content included in the Software are subject to change given the subject matter of the Software.  It is the responsibility of the user of the Software hereunder to monitor changes in applicable law.  Future versions of the Software may include updated content to reflect any changes in applicable law.

