require 'spec_helper'

describe IRCParser, "parsing notice" do

  # ; Message from Angel to Wiz.
  it_parses ":Angel NOTICE Wiz :Hello are you receiving this message ?" do |message|
    message.prefix.should == "Angel"
    message.target.should == "Wiz"
    message.body.should == "Hello are you receiving this message ?"
  end

  # ; Message to Angel.
  it_parses "NOTICE Angel :yes I'm receiving it !receiving it !'u>(768u+1n) .br" do |message|
    message.target.should == "Angel"
    message.body.should == "yes I'm receiving it !receiving it !'u>(768u+1n) .br"
  end

  # ; Message to a client on server tolsun.oulu.fi with username of "jto".
  it_parses "NOTICE jto@tolsun.oulu.fi :Hello !" do |message|
    message.target.should == "jto@tolsun.oulu.fi"
    message.body.should == "Hello !"
  end

  # ; Message to everyone on a server which has a name matching *.fi.
  it_parses "NOTICE $*.fi :Server tolsun.oulu.fi rebooting." do |message|
    message.server_pattern.should == /.*\.fi/
    message.body.should == "Server tolsun.oulu.fi rebooting."
  end

  # ; Message to all users who come from a host which has a name matching *.edu.
  it_parses "NOTICE #*.edu :NSFNet is undergoing work, expect interruptions" do |message|
    message.host_pattern.should == /.*\.edu/
    message.body.should == "NSFNet is undergoing work, expect interruptions"
  end

  #------------------------------------------------------------------------------

  it_generates IRCParser::Messages::Notice, ":Angel NOTICE Wiz :Hello are you receiving this message ?" do |message|
    message.prefix= "Angel"
    message.target= "Wiz"
    message.body= "Hello are you receiving this message ?"
  end

  it_generates IRCParser::Messages::Notice, "NOTICE Angel :yes I'm receiving it !receiving it !'u>(768u+1n) .br" do |message|
    message.target= "Angel"
    message.body= "yes I'm receiving it !receiving it !'u>(768u+1n) .br"
  end

  it_generates IRCParser::Messages::Notice, "NOTICE jto@tolsun.oulu.fi :Hello !" do |message|
    message.target= "jto@tolsun.oulu.fi"
    message.body= "Hello !"
  end

  it_generates IRCParser::Messages::Notice, "NOTICE $*.fi :Server tolsun.oulu.fi rebooting." do |message|
    message.server_pattern= "$*.fi"
    message.body= "Server tolsun.oulu.fi rebooting."
  end

  it_generates IRCParser::Messages::Notice, "NOTICE #*.edu :NSFNet is undergoing work, expect interruptions" do |message|
    message.host_pattern= "#*.edu"
    message.body= "NSFNet is undergoing work, expect interruptions"
  end
end