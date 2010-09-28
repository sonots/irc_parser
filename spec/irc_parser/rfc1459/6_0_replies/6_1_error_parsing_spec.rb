require 'spec_helper'

describe IRCParser, "error replies" do
  include IRCParser

  # Used to indicate the nickname parameter supplied to a command is currently unused.
  it_parses "401 Wiz Tony :No such nick/channel" do |message|
    message.nick.should == "Wiz"
    message.error_nick.should == "Tony"
  end

  # Used to indicate the server name given currently doesn't exist.
  it_parses "402 Wiz oga.com :No such server" do |message|
    message.nick.should == "Wiz"
    message.server.should == "oga.com"
  end

  # Used to indicate the given channel name is invalid.
  it_parses "403 Wiz #Carlitos :No such channel" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#Carlitos"
  end

  # Sent to a user who is either (a) not on a channel which is mode +n or (b)
  # not a chanop (or mode +v) on a channel which has mode +m set and is trying
  # to send a PRIVMSG message to that channel.
  it_parses "404 Wiz #something :Cannot send to channel" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#something"
  end

  # Sent to a user when they have joined the maximum number of allowed channels
  # and they try to join another channel.
  it_parses "405 Wiz #room :You have joined too many channels" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#room"
  end

  # Returned by WHOWAS to indicate there is no history information for that nickname.
  it_parses "406 Wiz John :There was no such nickname" do |message|
    message.nick.should == "Wiz"
    message.error_nick.should == "John"
  end

  # Returned to a client which is attempting to send a PRIVMSG/NOTICE using the
  # user@host destination format and for a user@host which has several
  # occurrences.
  it_parses "407 Wiz target :Duplicate recipients. No message delivered" do |message|
    message.nick.should == "Wiz"
    message.target.should == "target"
  end

  # PING or PONG message missing the originator parameter which is required
  # since these commands must work without valid prefixes.
  it_parses "409 Wiz :No origin specified"  do |message|
    message.nick.should == "Wiz"
  end

  # 412 - 414 (and 411?) are returned by PRIVMSG to indicate that the message wasn't
  # delivered for some reason. ERR_NOTOPLEVEL and ERR_WILDTOPLEVEL are errors
  # that are returned when an invalid use of "PRIVMSG $<server>" or "PRIVMSG
  # #<host>" is attempted.
  it_parses "411 Wiz :No recipient given (PRIVMSG)" do |message|
    message.nick.should == "Wiz"
    message.command.should == "PRIVMSG"
  end

  it_parses "412 Wiz :No text to send" do |message|
    message.nick.should == "Wiz"
  end

  it_parses "413 Wiz mask :No toplevel domain specified" do |message|
    message.nick.should == "Wiz"
    message.mask.should == "mask"
  end

  it_parses "414 Wiz mask :Wildcard in toplevel domain" do |message|
    message.nick.should == "Wiz"
    message.mask.should == "mask"
  end

  # Returned to a registered client to indicate that the command sent is
  # unknown by the server.
  it_parses "421 Wiz PILDONGA :Unknown command" do |message|
    message.nick.should == "Wiz"
    message.command.should == "PILDONGA"
  end

  # Server's MOTD file could not be opened by the server.
  it_parses "422 Wiz :MOTD File is missing" do |message|
    message.nick.should == "Wiz"
  end

  # Returned by a server in response to an ADMIN message when there is an error
  # in finding the appropriate information.
  it_parses "423 Wiz oulu.fi :No administrative info available" do |message|
    message.nick.should == "Wiz"
    message.server.should == "oulu.fi"
  end

  # Generic error message used to report a failed file operation during the
  # processing of a message.
  it_parses "424 Wiz :File error doing rm on readme.txt" do |message|
    message.nick.should == "Wiz"
    message.file_op.should == "rm"
    message.file.should == "readme.txt"
  end

  # Returned when a nickname parameter expected for a command and isn't found.
  it_parses "431 Wiz :No nickname given" do |message|
    message.nick.should == "Wiz"
  end

  # Returned after receiving a NICK message which contains characters which do
  # not fall in the defined set.
  it_parses "432 Wiz nick :Erroneus nickname" do |message|
    message.nick.should == "Wiz"
    message.error_nick.should == "nick"
  end

  # Returned when a NICK message is processed that results in an attempt to
  # change to a currently existing nickname.
  it_parses "433 Wiz nick :Nickname is already in use" do |message|
    message.nick.should == "Wiz"
    message.error_nick.should == "nick"
  end

  # Returned by a server to a client when it detects a nickname collision
  # (registered of a NICK that already exists by another server).
  it_parses "436 Wiz nick :Nickname collision KILL" do |message|
    message.nick.should == "Wiz"
    message.error_nick.should == "nick"
  end

  # Returned by the server to indicate that the target user of the command is
  # not on the given channel.
  it_parses "441 Wiz nick #channel :They aren't on that channel" do |message|
    message.nick.should == "Wiz"
    message.error_nick.should == "nick"
    message.channel.should == "#channel"
  end

  # Returned by the server whenever a client tries to perform a channel
  # effecting command for which the client isn't a member.
  it_parses "442 Wiz #channel :You're not on that channel" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#channel"
  end

  # Returned when a client tries to invite a user to a channel they are already
  # on.
  it_parses "443 Wiz user #channel :is already on channel" do |message|
    message.nick.should == "Wiz"
    message.user.should == "user"
    message.channel.should == "#channel"
  end

  # Returned by the summon after a SUMMON command for a user was unable to be
  # performed since they were not logged in.
  it_parses "444 Wiz user :User not logged in" do |message|
    message.nick.should == "Wiz"
    message.user.should == "user"
  end

  # Returned as a response to the SUMMON command.  Must be returned by any
  # server which does not implement it.
  it_parses "445 Wiz :SUMMON has been disabled" do |message|
    message.nick.should == "Wiz"
  end

  # Returned as a response to the USERS command.  Must be returned by any
  # server which does not implement it.
  it_parses "446 Wiz :USERS has been disabled" do |message|
    message.nick.should == "Wiz"
  end

  # Returned by the server to indicate that the client must be registered
  # before the server will allow it to be parsed in detail.
  it_parses "451 Wiz :You have not registered" do |message|
    message.nick.should == "Wiz"
  end

  # Returned by the server by numerous commands to indicate to the client that
  # it didn't supply enough parameters.
  it_parses "461 Wiz PRIVMSG :Not enough parameters" do |message|
    message.nick.should == "Wiz"
    message.command.should == "PRIVMSG"
  end

  # Returned by the server to any link which tries to change part of the
  # registered details (such as password or user details from second USER
  # message).
  it_parses "462 Wiz :You may not reregister" do |message|
    message.nick.should == "Wiz"
  end

  # Returned to a client which attempts to register with a server which does
  # not been setup to allow connections from the host the attempted connection is
  # tried.
  it_parses "463 Wiz :Your host isn't among the privileged" do |message|
    message.nick.should == "Wiz"
  end

  # Returned to indicate a failed attempt at registering a connection for which
  # a password was required and was either not given or incorrect.
  it_parses "464 Wiz :Password incorrect" do |message|
    message.nick.should == "Wiz"
  end

  # Returned after an attempt to connect and register yourself with a server
  # which has been setup to explicitly deny connections to you.
  it_parses "465 Wiz :You are banned from this server" do |message|
    message.nick.should == "Wiz"
  end

  it_parses "467 Wiz #channel :Channel key already set" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#channel"
  end

  it_parses "471 Wiz #channel :Cannot join channel (+l)" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#channel"
  end

  it_parses "472 Wiz c :is unknown mode char to me" do |message|
    message.nick.should == "Wiz"
    message.char.should == "c"
  end

  it_parses "473 Wiz #channel :Cannot join channel (+i)" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#channel"
  end

  it_parses "474 Wiz #channel :Cannot join channel (+b)" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#channel"
  end

  it_parses "475 Wiz #channel :Cannot join channel (+k)" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#channel"
  end

  # Any command requiring operator privileges to operate must return this error
  # to indicate the attempt was unsuccessful.
  it_parses "481 Wiz :Permission Denied- You're not an IRC operator" do |message|
    message.nick.should == "Wiz"
  end

  # Any command requiring 'chanop' privileges (such as MODE messages) must
  # return this error if the client making the attempt is not a chanop on the
  # specified channel.
  it_parses "482 Wiz #channel :You're not channel operator" do |message|
    message.nick.should == "Wiz"
    message.channel.should == "#channel"
  end

  # Any attempts to use the KILL command on a server are to be refused and this
  # error returned directly to the client.
  it_parses "483 Wiz :You cant kill a server!" do |message|
    message.nick.should == "Wiz"
  end

  # If a client sends an OPER message and the server has not been configured to
  # allow connections from the client's host as an operator, this error must be
  # returned.
  it_parses "491 Wiz :No O-lines for your host" do |message|
    message.nick.should == "Wiz"
  end

  # Returned by the server to indicate that a MODE message was sent with a
  # nickname parameter and that the a mode flag sent was not recognized.
  it_parses "501 Wiz :Unknown MODE flag" do |message|
    message.nick.should == "Wiz"
  end

  # Error sent to any user trying to view or change the user mode for a user
  # other than themselves.
  it_parses "502 Wiz :Cant change mode for other users" do |message|
    message.nick.should == "Wiz"
  end

  #------------------------------------------------------------------------------

  it_generates IRCParser::Messages::ErrNoSuchNick, "401 Wiz Tony :No such nick/channel" do |message|
    message.nick= "Wiz"
    message.error_nick= "Tony"
  end

  it_generates IRCParser::Messages::ErrNoSuchServer, "402 Wiz oga.com :No such server" do |message|
    message.nick= "Wiz"
    message.server= "oga.com"
  end

  it_generates IRCParser::Messages::ErrNoSuchChannel, "403 Wiz #Carlitos :No such channel" do |message|
    message.nick= "Wiz"
    message.channel= "#Carlitos"
  end

  it_generates IRCParser::Messages::ErrCannotSendToChan, "404 Wiz #something :Cannot send to channel" do |message|
    message.nick= "Wiz"
    message.channel= "#something"
  end

  it_generates IRCParser::Messages::ErrTooManyChannels, "405 Wiz #room :You have joined too many channels" do |message|
    message.nick= "Wiz"
    message.channel= "#room"
  end

  it_generates IRCParser::Messages::ErrWasNoSuchNick, "406 Wiz John :There was no such nickname" do |message|
    message.nick= "Wiz"
    message.error_nick= "John"
  end

  it_generates IRCParser::Messages::ErrTooManyTargets, "407 Wiz target :Duplicate recipients. No message delivered" do |message|
    message.nick= "Wiz"
    message.target= "target"
  end

  it_generates IRCParser::Messages::ErrNoOrigin, "409 Wiz :No origin specified"  do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrNoRecipient, "411 Wiz :No recipient given (PRIVMSG)" do |message|
    message.nick= "Wiz"
    message.command= "PRIVMSG"
  end

  it_generates IRCParser::Messages::ErrNoTextToSend, "412 Wiz :No text to send" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrNoTopLevel, "413 Wiz mask :No toplevel domain specified" do |message|
    message.nick= "Wiz"
    message.mask= "mask"
  end

  it_generates IRCParser::Messages::ErrWildTopLevel, "414 Wiz mask :Wildcard in toplevel domain" do |message|
    message.nick= "Wiz"
    message.mask= "mask"
  end

  it_generates IRCParser::Messages::ErrUnknownCommand, "421 Wiz PILDONGA :Unknown command" do |message|
    message.nick= "Wiz"
    message.command= "PILDONGA"
  end

  it_generates IRCParser::Messages::ErrNoMotd, "422 Wiz :MOTD File is missing" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrNoAdminInfo, "423 Wiz oulu.fi :No administrative info available" do |message|
    message.nick= "Wiz"
    message.server= "oulu.fi"
  end

  it_generates IRCParser::Messages::ErrFileError, "424 Wiz :File error doing rm on readme.txt" do |message|
    message.nick= "Wiz"
    message.file_op= "rm"
    message.file= "readme.txt"
  end

  it_generates IRCParser::Messages::ErrNoNickNameGiven, "431 Wiz :No nickname given" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrErroneusNickName, "432 Wiz nick :Erroneus nickname" do |message|
    message.nick= "Wiz"
    message.error_nick= "nick"
  end

  it_generates IRCParser::Messages::ErrNickNameInUse, "433 Wiz nick :Nickname is already in use" do |message|
    message.nick= "Wiz"
    message.error_nick= "nick"
  end

  it_generates IRCParser::Messages::ErrNickCollision, "436 Wiz nick :Nickname collision KILL" do |message|
    message.nick= "Wiz"
    message.error_nick= "nick"
  end

  it_generates IRCParser::Messages::ErrUserNotInChannel, "441 Wiz nick #channel :They aren't on that channel" do |message|
    message.nick= "Wiz"
    message.error_nick= "nick"
    message.channel= "#channel"
  end
  it_generates IRCParser::Messages::ErrNotOnChannel, "442 Wiz #channel :You're not on that channel" do |message|
    message.nick= "Wiz"
    message.channel= "#channel"
  end

  it_generates IRCParser::Messages::ErrUserOnChannel, "443 Wiz user #channel :is already on channel" do |message|
    message.nick= "Wiz"
    message.user= "user"
    message.channel= "#channel"
  end

  it_generates IRCParser::Messages::ErrNoLogin, "444 Wiz user :User not logged in" do |message|
    message.nick= "Wiz"
    message.user= "user"
  end

  it_generates IRCParser::Messages::ErrSummonDisabled, "445 Wiz :SUMMON has been disabled" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrUsersDisabled, "446 Wiz :USERS has been disabled" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrNotRegistered, "451 Wiz :You have not registered" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrNeedMoreParams, "461 Wiz PRIVMSG :Not enough parameters" do |message|
    message.nick= "Wiz"
    message.command= "PRIVMSG"
  end

  it_generates IRCParser::Messages::ErrAlreadyRegistred, "462 Wiz :You may not reregister" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrNoPermForHost, "463 Wiz :Your host isn't among the privileged" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrPasswdMismatch, "464 Wiz :Password incorrect" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrYouReBannedCreep, "465 Wiz :You are banned from this server" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrKeySet, "467 Wiz #channel :Channel key already set" do |message|
    message.nick= "Wiz"
    message.channel= "#channel"
  end

  it_generates IRCParser::Messages::ErrChannelIsFull, "471 Wiz #channel :Cannot join channel (+l)" do |message|
    message.nick= "Wiz"
    message.channel= "#channel"
  end

  it_generates IRCParser::Messages::ErrUnknownMode, "472 Wiz c :is unknown mode char to me" do |message|
    message.nick= "Wiz"
    message.char= "c"
  end

  it_generates IRCParser::Messages::ErrInviteOnLYChan, "473 Wiz #channel :Cannot join channel (+i)" do |message|
    message.nick= "Wiz"
    message.channel= "#channel"
  end

  it_generates IRCParser::Messages::ErrBannedFromChan, "474 Wiz #channel :Cannot join channel (+b)" do |message|
    message.nick= "Wiz"
    message.channel= "#channel"
  end

  it_generates IRCParser::Messages::ErrBadChannelKey, "475 Wiz #channel :Cannot join channel (+k)" do |message|
    message.nick= "Wiz"
    message.channel= "#channel"
  end

  it_generates IRCParser::Messages::ErrNoPrivileges, "481 Wiz :Permission Denied- You're not an IRC operator" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrChanOPrivsNeeded, "482 Wiz #channel :You're not channel operator" do |message|
    message.nick= "Wiz"
    message.channel= "#channel"
  end

  it_generates IRCParser::Messages::ErrCantKillServer, "483 Wiz :You cant kill a server!" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrNoOperHost, "491 Wiz :No O-lines for your host" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrUModeUnknownFlag, "501 Wiz :Unknown MODE flag" do |message|
    message.nick= "Wiz"
  end

  it_generates IRCParser::Messages::ErrUsersDontMatch, "502 Wiz :Cant change mode for other users" do |message|
    message.nick= "Wiz"
  end
end
