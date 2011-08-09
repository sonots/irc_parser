module IRCParser::Messages
  define_message :ErrNoSuchNick       , '401', :nick, :error_nick, "No such nick/channel"
  define_message :ErrNoSuchServer     , '402', :nick, :server, "No such server"
  define_message :ErrNoSuchChannel    , '403', :nick, :channel, "No such channel"
  define_message :ErrCannotSendToChan , '404', :nick, :channel, "Cannot send to channel"
  define_message :ErrTooManyChannels  , '405', :nick, :channel, "You have joined too many channels"
  define_message :ErrWasNoSuchNick    , '406', :nick, :error_nick, "There was no such nickname"
  define_message :ErrTooManyTargets   , '407', :nick, :target, "Duplicate recipients. No message delivered"
  define_message :ErrNoOrigin         , '409', :nick, "No origin specified"
  define_message :ErrNoRecipient      , '411', :nick, "No recipient given (%{command})"
  define_message :ErrNoTextToSend     , '412', :nick, "No text to send"
  define_message :ErrNoTopLevel       , '413', :nick, :mask, "No toplevel domain specified"
  define_message :ErrWildTopLevel     , '414', :nick, :mask, "Wildcard in toplevel domain"
  define_message :ErrUnknownCommand   , '421', :nick, :command, "Unknown command"
  define_message :ErrNoMotd           , '422', :nick, "MOTD File is missing"
  define_message :ErrNoAdminInfo      , '423', :nick, :server, "No administrative info available"
  define_message :ErrFileError        , '424', :nick, "File error doing %{fileop} on %{file}"
  define_message :ErrNoNickNameGiven  , '431', :nick, "No nickname given"
  define_message :ErrErroneusNickName , '432', :nick, :error_nick, "Erroneus nickname"
  define_message :ErrNickNameInUse    , '433', :nick, :error_nick, "Nickname is already in use"
  define_message :ErrNickCollision    , '436', :nick, :error_nick, "Nickname collision KILL"
  define_message :ErrUserNotInChannel , '441', :nick, :error_nick, :channel, "They aren't on that channel"
  define_message :ErrNotOnChannel     , '442', :nick, :channel, "You're not on that channel"
  define_message :ErrUserOnChannel    , '443', :nick, :user, :channel, "is already on channel"
  define_message :ErrNoLogin          , '444', :nick, :user, "User not logged in"
  define_message :ErrSummonDisabled   , '445', :nick, "SUMMON has been disabled"
  define_message :ErrUsersDisabled    , '446', :nick, "USERS has been disabled"
  define_message :ErrNotRegistered    , '451', :nick, "You have not registered"
  define_message :ErrNeedMoreParams   , '461', :nick, :command, "Not enough parameters"
  define_message :ErrAlreadyRegistred , '462', :nick, "You may not reregister"
  define_message :ErrNoPermForHost    , '463', :nick, "Your host isn't among the privileged"
  define_message :ErrPasswdMismatch   , '464', :nick, "Password incorrect"
  define_message :ErrYouReBannedCreep , '465', :nick, "You are banned from this server"
  define_message :ErrKeySet           , '467', :nick, :channel, "Channel key already set"
  define_message :ErrChannelIsFull    , '471', :nick, :channel, "Cannot join channel (+l)"
  define_message :ErrUnknownMode      , '472', :nick, :char, "is unknown mode char to me"
  define_message :ErrInviteOnLYChan   , '473', :nick, :channel, "Cannot join channel (+i)"
  define_message :ErrBannedFromChan   , '474', :nick, :channel, "Cannot join channel (+b)"
  define_message :ErrBadChannelKey    , '475', :nick, :channel, "Cannot join channel (+k)"
  define_message :ErrNoPrivileges     , '481', :nick, "Permission Denied- You're not an IRC operator"
  define_message :ErrChanOPrivsNeeded , '482', :nick, :channel, "You're not channel operator"
  define_message :ErrCantKillServer   , '483', :nick, "You cant kill a server!"
  define_message :ErrNoOperHost       , '491', :nick, "No O-lines for your host"
  define_message :ErrUModeUnknownFlag , '501', :nick, "Unknown MODE flag"
  define_message :ErrUsersDontMatch   , '502', :nick, "Cant change mode for other users"

  # Not Used / Reserved ( http://tools.ietf.org/html/rfc1459#section-6.3
  # :YouWillBeBanned
  # :BadChanMask
  # :NoServiceHost
end
