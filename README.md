[![Ruby](https://github.com/Krule/rblocks/actions/workflows/main.yml/badge.svg)](https://github.com/Krule/rblocks/actions/workflows/main.yml)

# Ruby Blocks

Ruby Blocks is a set of basic utilities built on top of the Ruby Ractor.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rblocks'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rblocks

## Usage

### Timer

```ruby
require "rblocks/timer"

timer = RBlock::Timer.new(30) # Set timer for 30s
timer.wait # block until timer is done
```

alternatively, one could pass a block:

```ruby
require "rblocks/timer"

timer = RBlock::Timer.new(0.001) # Set timer for 1ms
timer.wait { |_t| puts "done" } # execute block when timer is done
```

### Ticker

```ruby
require "rblocks/ticker"

ticker = RBlock::Ticker.new(1) # Tick once every second

10.times do
  ticker.wait { puts "tick" } # output "tick" 10 times with a delay of 1s between each
end

ticker.stop!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krule/rblocks. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/krule/rblocks/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RBlocks::Timer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/krule/rblocks/blob/master/CODE_OF_CONDUCT.md).
