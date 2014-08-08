# Password Vault

Ultra simple, web based, team password manager.

[ ![Codeship Status for samuelwford/password_vault](https://codeship.io/projects/f996c870-fdfc-0131-d4fe-52725ace5304/status)](https://codeship.io/projects/29497)

## Getting Setup for Development

This app is Rails 4 & Ruby 2.1 app. I recommend using [rbenv](https://github.com/sstephenson/rbenv) to manage your Ruby environment. The repository includes a `.ruby-version` file which will set the local Ruby version.

The database is PostgreSQL for development and production environments. I recommend using [Postgress.app](http://postgresapp.com) If you have difficulty install the `pg` gem, install the gem manually as follows:

```
gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config
```

Make note of the version in the path; yours may have changed.

### Links

* [Heroku Dashboard](https://dashboard.heroku.com/apps/password-vault-develop/resources)
* [NewRelic Dashboard](https://rpm.newrelic.com/accounts/732174/applications)
* [papertrail Log](https://papertrailapp.com/systems/password-vault-develop/events)