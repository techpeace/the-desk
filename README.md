# The Desk

## Dependencies

This application requires:

* Ruby version 2.0.0
* Rails version 4.0.1

[Learn more about installing Rails.](http://railsapps.github.io/installing-rails.html)

### Database

This application uses PostgreSQL with ActiveRecord.

## Getting Started

Copy the application config:

```console
$ cp config/application.yml.example config/application.yml
```

Edit that to set up the creds for your test account. Then do the same for the `database.yml` before you run the following:

```console
$ bundle exec rake db:create db:migrate db:seed
```

Now you're good to go! Check out `db/seeds.rb` to see how you can create additional test users.

## Libraries

* Template Engine: Slim
* Testing Framework: RSpec
* Front-end Framework: Zurb Foundation
* Form Builder: SimpleForm
* Authentication: Devise
* Authorization: CanCan
* SMTP: Mandrill

## Troubleshooting

We're using [GitHub Issues](http://github.com/techpeace/the-desk/issues) for our ticket tracker. Kindly report any issues you encounter there.

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send us a pull request.

If you add functionality to this application, create an alternative implementation, or build an application that is similar, please contact me and I'll add a note to the README so that others can find your work. Thanks!

## Credits

This application was created in collaboration with [The Four Teachers Project](http://fourteachersproject.org/) to better the lives of Texas educators. The code was written by these fine folks:

* [Matt Buck](http://github.com/techpeace)
* [Karo Kohashigawa](http://github.com/kaorudev)
* [Sonny Gonzales](http://github.com/sonnyg-atx)

## License

We haven't decided, yet! Likely MIT, but if you're interested in using it, just create an issue so we can discuss it.