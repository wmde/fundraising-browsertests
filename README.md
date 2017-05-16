FundraisingBrowserTests
====================
This directory contains browser tests for the spenden.wikimedia.de fundraising application.

## Prerequisites
See prerequisites on [Browser Testing for Wikidata](https://www.mediawiki.org/wiki/Wikibase/Programmer%27s_guide_to_Wikibase#Browser_Testing_for_Wikidata).

OR follow these steps (Linux):

    \curl -L https://get.rvm.io | bash -s stable --ruby 
    source /home/USERNAME/.rvm/scripts/rvm && rvm
    
    gem update --system
    gem install bundler
    bundle install
    
    git clone https://github.com/wmde/fundraising-browsertests.git
    cd fundraising-browsertests
    bundle install  

You have to have [geckodriver installed](https://stackoverflow.com/questions/40669953/watir-unable-to-find-mozilla-geckodriver) 
(1.15 or later for modern browsers) for the tests to be able to interact with your browser.

## Configuration

PayPal Sandbox parameters in config.yml

    PAYPAL_USERNAME: ""
    PAYPAL_PASSWORD: ""

Frontend URL

    FRONTEND_URL: "http://localhost/frontend"

## Executing tests

Tests are organized in *feature*s that have a *background* and one or more *scenario*s.
Each feature and/or scenario can be [tagged](https://github.com/cucumber/cucumber/wiki/Tags) to
organise the tests.

Run all tests (as per the [*default* profile](config/cucumber.yml))
```shell
bundle exec cucumber
```

### More complex invocation options

Run all (really all) tests
```shell
bundle exec cucumber -P
```

Run a specific feature
```shell
bundle exec cucumber features/frontend.frontpage.feature
```

Run a specific scenario (codeline)
```shell
bundle exec cucumber features/frontend.frontpage.feature:42
```

Run only tests with a specific tag
```shell
bundle exec cucumber --tag @foo_bar
```

Run only tests without a specific tag
```shell
bundle exec cucumber --tag ~@foo_bar
```

E.g.: Run frontend tests but no UI-only tests and no tests that use stuff deployed on test
```shell
bundle exec cucumber features/frontend.* --tag ~@only_online --tag ~@ui_only
```

## Executing tests on Sauce Labs

Uncomment Sauce Labs configuration in config.yml

Adjust Browser settings according to https://saucelabs.com/platforms/webdriver

Execute tests as seen above
