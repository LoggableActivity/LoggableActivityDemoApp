# LoggableActivity Demo project
The LoggableActivity is a Rails 7 app that demonstrate the [loggable activity gem](https://rubygems.org/search?query=loggable_activity) and is used to perform integration tests of the gem.

The loggable_activity gem creates a log of user activities.<br/>
For a loggable_activity getting started guide please visit [github](https://github.com/maxgronlund/LoggableActivity/blob/main/GETTING-STARTED.md)

## Requirements
- Postresql
- Ruby 3.2

## Installation of the demo project
```
$ git clone https://github.com/maxgronlund/LoggableActivityDemoApp
$ bundle install
$ rake db:create && rake db:migrate && db:seed
$ rails server
```
Now you should be able to open the demo app on [http://localhost:3000](http://localhost:3000)

## Test
```
$ rspec .
```
## Codeformatting
```
$ rubocop
```

## Development of the loggable_activity on you local machine
Update the gemfile so it points to your local version of the loggable_activity gem
```
gem 'loggable_activity', '~> x.x.x', path: '/THE_LOCATION_OF_THE_GEM/LoggableActivity'
# gem 'loggable_activity', '~> 'x.x.x'
```

## Clone the gem from github and build it on you local machine
[https://github.com/maxgronlund/LoggableActivity](https://github.com/maxgronlund/LoggableActivity)
```
$ gem build loggable_activity.gemspec
```
Now you can run your changes to the gem in the this demo project.

## debugging
This can be solved by the use of our new debugging tool Ruby Debugger which is built-in to Rails 7.
In order to debug processes, you now have to launch `bundle exec rdbg -a` in a different terminal after launching our server with `bin/dev`.
This will allow the Ruby Debugger to connect to our Rails Server as a remote process, and all debugger break points will be handled there.