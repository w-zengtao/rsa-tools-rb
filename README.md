# Rsa::Tools

This Gem offered 8 frequently uesed methods for Sign & Verify & Encrypt & Decrypt with RSA.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rsa-tools'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rsa-tools

## Usage

I offered 3 pairs of methods and 2 generator method in this tool

#### 2 Generator method

* `Rsa::Tools#key_pairs` 

```ruby
# This method will return an array of text, the first text string is private_key and the last text is public_key

Rsa::Tools.key_pairs
```

* `Rsa::Tools#pem_pairs(pub_path = nil, pri_path = nil)`

```ruby
# This method intend to offer you pems of key pairs, the first param is the path you want to store your private key
# And the default path is keys/private_key.pem & keys/public_key.pem
# Use the default path is my advice

Rsa::Tools.pem_pairs
```

#### 3 pairs of methods

* `Sign & Verify`

```ruby
# This pair of method offer the ablity to verify the source of data
# The returned signature were encoded by Base64

Rsa::Tools.sign(private_key, data)                 # this returns the signature
Rsa::Tools.verify(public_key, data, original_data) # this returns true or false
```

* `Encrypt & Decrypt`

```ruby
# I advice you use this pair while your user do not need have his own private_key (ToC)

Rsa::Tools.encrypt(private_key, data)       # this returns the encrypted string
Rsa::Tools.decrypt(public_key, encrypted)   # this returns the original data
```

* `PubEncrypt & PriDecrypt`

```ruby
# I advice you use this pair while your user should offer his public key to you (Which means ToB)

Rsa::Tools.pub_encrypt(public_key, data)         # this returns the encrypted string
Rsa::Tools.pri_decrypt(private_key, encrypted)   # this returns the original data
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [Here](https://github.com/w-zengtao/rsa-tools). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rsa::Tools project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/w-zengtao/rsa-tools/blob/master/CODE_OF_CONDUCT.md).
