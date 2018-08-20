# JSONAPI Swagger Blocks Generator

[![Gem Version](https://badge.fury.io/rb/jsonapi-swagger-blocks-generator.svg)](https://badge.fury.io/rb/jsonapi-swagger-blocks-generator) [![Maintainability](https://api.codeclimate.com/v1/badges/2de3e3c4e8fb1543a687/maintainability)](https://codeclimate.com/github/g13ydson/jsonapi-swagger-blocks-generator/maintainability) <a href="https://codeclimate.com/github/g13ydson/jsonapi-swagger-blocks-generator/test_coverage"><img src="https://api.codeclimate.com/v1/badges/2de3e3c4e8fb1543a687/test_coverage" /></a> [![Build Status](https://travis-ci.org/g13ydson/jsonapi-swagger-blocks-generator.svg?branch=master)](https://travis-ci.org/g13ydson/jsonapi-swagger-blocks-generator)

   creates swagger blocks files based on the JSONAPI::Resource file http://jsonapi-resources.com/ 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jsonapi-swagger-blocks-generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsonapi-swagger-blocks-generator

## Usage

    $ rails g jsonapi:swagger_blocks User

or specifying the namespace of the resources folder

    $ rails g jsonapi:swagger_blocks User Api::V1 


## Contributing

# Contributing to JSONAPI Swagger blocks generator

We are following the Gitflow workflow. The active development branch is [dev](https://github.com/g13ydson/jsonapi-swagger-blocks-generator/tree/dev), the stable branch is [master](https://github.com/g13ydson/jsonapi-swagger-blocks-generator/tree/master).

Contributions will be accepted to the [dev](https://github.com/g13ydson/jsonapi-swagger-blocks-generator/tree/dev) only.

## How to provide a patch for a new feature

1. If it is a major feature, please create an [Issue]( https://github.com/g13ydson/jsonapi-swagger-blocks-generator/issues ) and discuss with the project leaders.

2. If in step 1 you get an acknowledge from the project leaders, use the
   following procedure to submit a patch:

    a. Fork Fast JSONAPI Swagger blocks generator on github ( http://help.github.com/fork-a-repo/ )

    b. Create a topic branch (git checkout -b my_branch)

    c. Push to your branch (git push origin my_branch)

    d. Initiate a pull request on github ( http://help.github.com/send-pull-requests/ )

    e. Done :)

3. Run the tests. We only take pull requests with passing tests.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SwaggerBlocksGenerator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/g13ydson/jsonapi-swagger-blocks-generator/blob/master/CODE_OF_CONDUCT.md).
