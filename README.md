# Tavern

Simple TODO app. A personal project to learn Ruby and RSpec.

## Installation

Add this line to your application's Gemfile:

    gem 'tavern'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tavern

## Usage

    tavern init .
    tavern new "send that email" normal
    tavern new "review that important stuff" high
    tavern list
    # 1. [ ] review that important stuff
    # 2. [ ] send that email
    tavern 1 done # or tavern "review that " done
    tavern list
    # 1. [ ] review that important stuff
    # 2. [x] review that important stuff

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
