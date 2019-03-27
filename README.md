# ConnectNGame

This gem is a connect game with flexible board sizes. The classical game is
a seven by six playing rack with a goal of four in a row. This game supports
up to 14 by 12 rack with a goal of eight in a row.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'connect_n_game'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install connect_n_game

## Usage

From the command line simply type:

    $ connect_n_game [options]

To embed the game in another program use:

```ruby
require 'connect_n_game'
```

and then {W.I.P.}

### Options

To get help simply enter:

    $ connect_n_game --help

The available options are:

```
Welcome to the Connect N Command Line Interface.
This is game version: 0.0.1.

Usage info: connect_n_game <options>

--help, -h, -?      -- Display this message and quit.
--player, -p <name> -- Select player or automaton 'name'
                       Note: Limit of two players
--order, -o <4..8>  -- The winning run length. Default=4
--debug, -d         -- Display debug info.

Player Selection:
  Basic     Minimum tactical analysis.
  Bruce     An actual player.
  Echo      Really unoriginal.
  Human     An actual player.
  Middle    Moves toward the middle
  Prudent   Minimum tactical analysis with some defense.
  Random    Moves randomly.
  Sheila    An actual player.
```

## Contributing

1. Fork it ( https://github.com/PeterCamilleri/connect_n_game/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the
[MIT License](./LICENSE.txt).

## Code of Conduct

Everyone interacting in the fully_freeze project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](./CODE_OF_CONDUCT.md).
