# Liquid Autoescape Changelog

## 2.0.0 / 2019-03-21

* Support Liquid 4
* Support passing the enabled state to the `{% autoescape %}` tag
* Require Ruby >= 2.2

## 1.0.0 / 2017-12-21

* Require Ruby >= 2.1

## 0.2.2 / 2017-12-21

* Upgrade the minimum version of `yard` to avoid a security vulnerability
* Update development dependencies

## 0.2.1 / 2015-05-15

* Bump version for release to RubyGems

## 0.2.0 / 2015-05-11

* Add support for user-defined escaping exemptions
* Allow auto-escaping to run in a global mode that escapes all template variables
* Provide a customizable list of filters that should cause escaping to be skipped

## 0.1.1 / 2015-05-07

* Prevent variables following a closed `{% autoescape %}` tag from being escaped

## 0.1.0 / 2015-05-06

* Initial release
