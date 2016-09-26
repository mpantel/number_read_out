# NumberReadOut

This is a utility gem to convert numbers or currencies, to text in Greek and English.

Usefull where a full text number representation is needed as in cheques and invoices.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'number_read_out'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install number_read_out

## Usage

###Currently supports:

Languages:
    :en => 'English',
    :gr => 'Greek'
Currencies:
    :euro => 'Euro'
    :drachmas => 'Drachmas', just in case


NumberReadOut.full_currency_text(amount,currency,language)

Where amount is up to 999999999999999999,99€ that is:

NINE HUNDRED AND NINETY-NINE QUADRILLION
NINE HUNDRED AND NINETY-NINE TRILLION
NINE HUNDRED AND NINETY-NINE BILLION
NINE HUNDRED AND NINETY-NINE MILLION
NINE HUNDRED AND NINETY-NINE THOUSAND
NINE HUNDRED AND NINETY-NINE EURO
AND
NINETY-NINE EUROCENTS

or in Geek drachmas:

ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑ ΕΝΝΕΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΑ
ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑ ΕΝΝΕΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ
ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑ ΕΝΝΕΑ ΔΙΣΕΚΑΤΟΜΥΡΙΑ
ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑ ΕΝΝΕΑ ΕΚΑΤΟΜΥΡΙΑ
ΕΝΝΙΑΚΟΣΙEΣ ΕΝΕΝΗΝΤΑ ΕΝΝΕΑ ΧΙΛΙΑΔΕΣ
ΕΝΝΙΑΚΟΣΙEΣ ΕΝΕΝΗΝΤΑ ΕΝΝΕΑ ΔΡΑΧΜΕΣ
ΚΑΙ
ΕΝΕΝΗΝΤΑ ΕΝΝΕΑ ΛΕΠΤΑ


### Caveats

For _now_ only positive currencies for up to two decimal digits are supported. Additional decimal digits are truncated.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mpantel/number_read_out. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

