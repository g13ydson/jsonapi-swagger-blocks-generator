# JSONAPI Swagger Blocks Generator

   creates the swagger blocks files documentation based on the JSONAPI::Resource file http://jsonapi-resources.com/ 

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

Bug reports and pull requests are welcome on GitHub at https://github.com/g13ydson/jsonapi-swagger-blocks-generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SwaggerBlocksGenerator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/g13ydson/jsonapi-swagger-blocks-generator/blob/master/CODE_OF_CONDUCT.md).
