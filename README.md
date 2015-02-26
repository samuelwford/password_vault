# Password Vault

Ultra simple, web based, team password manager.

[ ![Codeship Status for oneupsports/password-vault](https://codeship.com/projects/1af8dfd0-9f3b-0132-84c6-520a26f6f18f/status?branch=master)](https://codeship.com/projects/65085)

## Getting Setup for Development

This app is Rails 4 & Ruby 2.1 app. I recommend using [rbenv](https://github.com/sstephenson/rbenv) to manage your Ruby environment. The repository includes a `.ruby-version` file which will set the local Ruby version.

The database is PostgreSQL for development and production environments. I recommend using [Postgress.app](http://postgresapp.com) If you have difficulty install the `pg` gem, install the gem manually as follows:

```
gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.4/bin/pg_config
```

Make note of the version in the path; yours may have changed.

Since the application is intended to be deployed to Heroku, install [Foreman](https://github.com/ddollar/foreman).
To run the app with foreman, use:

```
$ foreman start
```

The application uses Google OpenID Connect to authenticate users and expects to get the
client Id and secret from the environment. You'll need to create a `.env` file in the root
of the project with the following settings:

```
GOOGLE_CLIENT_ID=<id from google developers console>
GOOGLE_CLIENT_SECRET=<secret from google developer console>
RESTRICT_OAUTH_TO_EMAILS_SUFFIX=1up.fm
```

The Google Apps OpenID Connect project is called [OneUp Password Vault](https://console.developers.google.com/project/lucky-trail-665) on 
[Google Developer Console](https://console.developers.google.com/project).

### Links

* [Heroku Dashboard](https://dashboard.heroku.com/apps/oneup-password-vault/resources)

## ToDo

* import/export via keepass files
* encrypt passwords in db, decrypt in browser
* add fields to password:
 * api key
 * attachment
* change queue?
