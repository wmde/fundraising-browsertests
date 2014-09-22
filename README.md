FundraisingBrowserTests
====================
This directory contains browser tests for the fundraising application.

## Prerequisites
See prerequisites on [Browser Testing for Wikidata](https://www.mediawiki.org/wiki/Wikibase/Programmer%27s_guide_to_Wikibase#Browser_Testing_for_Wikidata).

## Configuration

PayPal Sandbox parameters in config.yml
	PAYPAL_USERNAME: ""
	PAYPAL_PASSWORD: ""

Frontend / Backend URL
	BACKEND_URL: "http://localhost/backend/"
	FRONTEND_URL: "http://localhost/frontend"

## Executing tests

Update/install gems
```shell
bundle update
```

Run all tests
```shell
bundle exec cucumber
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

## Executing tests on Sauce Labs

Uncomment Sauce Labs configuration in config.yml

Adjust Browser settings according to https://saucelabs.com/platforms/webdriver

Execute tests as seen above