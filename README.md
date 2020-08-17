# Purpose App
This app is a work in progress. The most recent stable deployment is available [here](https://arcane-anchorage-01507.herokuapp.com/).

## Local development

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
