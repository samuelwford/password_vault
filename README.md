# Password Vault

Ultra simple, web based, team password manager.

[ ![Codeship Status for samuelwford/password_vault](https://codeship.io/projects/f996c870-fdfc-0131-d4fe-52725ace5304/status)](https://codeship.io/projects/29497)

## Getting Setup for Development

This app is Rails 4 & Ruby 2.1 app. I recommend using [rbenv](https://github.com/sstephenson/rbenv) to manage your Ruby environment. The repository includes a `.ruby-version` file which will set the local Ruby version.

The database is PostgreSQL for development and production environments. I recommend using [Postgress.app](http://postgresapp.com) If you have difficulty install the `pg` gem, install the gem manually as follows:

```
gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.4/bin/pg_config
```

Make note of the version in the path; yours may have changed.

### Links

* [Heroku Dashboard](https://dashboard.heroku.com/apps/password-vault-develop/resources)

## ToDo

* sweeten up ui a little
* import/export via keepass files
* encrypt passwords in db, decrypt in browser
* user
 * allow admin to reset any password
 * allow current user to reset their password
 * make user name required, update devise views
* add fields to password:
 * api key
 * attachment
* password history
 * timestamp
 * user
 * action
 * value
* change queue?
* setup google oath login

### Devise Notes

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views
