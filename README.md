# IRCParser

A ruby 1.9.x parser for IRC messages which includes commands, errors and
replies classese according to the IRC RFCs definitions.

This library does not deal at all with networking.

## Goals

In every irc library I've seen people implement the various irc messages
again and again.

IRCParser tackles that boring task so the hard work in making the RFC
compliant IRC messages can be shared across projects.

## Anatomy of an IRC message

All irc messages have the same structure:

  [optional prefix] COMMAND_NAME [optional_param [optional_param2, ...]] [optional postfix]

* The prefix always denotes a server or user name, and starts with ':'.
* The params are completely optional. IRCParser gives all params
  apropriate names reflecting those found on the RFCs.
* The postfix is the last parameter. IRCParser sometimes aliases the
  postfix to something more readable for some messages (e.g. 'body' for
  PRIVMSG). The only kind of parameters which can embed spaces are the
  postfixes.

## Parsing Messages

The parser can be run so it returns the raw components of an irc message
([prefix, command, *params]), or an specific class for each kind of
message constructed from those parts.

The parser is quite strict so it will expect the IRC delimiters in all
messages to parse (i.e. all messages must end with '\r\n').

```ruby
  require 'irc_parser'

  # returns prefix, command, params. Notice final \r\n
  IRCParser.parse_raw(":Angel PRIVMSG Wiz :Hello are you receiving this message?\r\n")

  # => ["Angel", "PRIVMSG", ["Wiz", "Hello are you receiving this message ?"]]
```

To get a subclass of IRCParser::Message instead of an array of components:

```ruby
  require 'irc_parser/messages'
  msg = IRCParser.parse(":Angel PRIVMSG Wiz :Hello are you receiving this message?\r\n")
  #<struct Struct::IRCPrivMsg prefix="Angel", target="Wiz", postfix="Hello are you receiving this message?">

  msg.identifier # => "PRIVMSG"
  msg.to_sym     # => :priv_msg
  msg.prefix     # => "Angel"
  msg.params     # => ["Wiz", "Hello are you receiving this message?"]
  msg.from       # => "Angel"
  msg.target     # => "Wiz"
  msg.body       # => "Hello are you receiving this message?"
```

## Generating Messages

```ruby
  msg = IRCParser::Messages::PrivMsg.new
  msg.from   = "Wiz"
  msg.target = "Angel"
  msg.body   = "Hello World!"
  msg.to_s   # => ":Wiz PRIVMSG Angel :Hello World!\r\n"
```

There is also a shortcut:

```ruby
  require 'irc_parser/messages'
  IRCParser.message(:privmsg) do |m|
    m.from   = "Wiz"
    m.target = "Angel"
    m.body   = "Hello World!"
  end.to_s # => ":Wiz PRIVMSG Angel :Hello World!\r\n"
```

## TODO

* Documentation!
* It would be nice to add support for parsing/generating extended mirc
  messages.
* Most severs/clients do not implement the messages exactly as defined
  on the RFCs (sometimes http://www.mirc.net/raws/ was used as
  reference). So, some messages may require adjustments to be usable
  in the wild.
* 1459 compliant, with some of the messages updated to the rfc 2812.
  Fixes/updates are warmly welcome!

## AUTHORS

A lot of projects where reviewed while implementing this library.  I may
or may not have stolen something from one of these, although off course
I'm the only one to blame for the contents of this gem. If I forget
about anyone please ping me so I can include you here.

* Ragel parser and other portions where taken from irk (brodock/irk)
