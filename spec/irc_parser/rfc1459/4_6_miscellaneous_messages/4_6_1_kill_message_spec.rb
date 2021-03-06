require 'spec_helper'

describe IRCParser, "parsing kill msg" do
  # Parameters: <nickname> <comment>

  # ; Nickname collision between csd.bu.edu and tolson.oulu.fi"
  # NOTE I added the colon, I don't think it makes sense to have this single
  # case of space-aware parameter...
  it_parses "KILL David :(csd.bu.edu <- tolsun.oulu.fi)" do |msg|
    msg.nick.should == "David"
    msg.kill_message.should == "(csd.bu.edu <- tolsun.oulu.fi)"
  end

  #------------------------------------------------------------------------------

  it_generates IRCParser::Messages::Kill, "KILL David :(csd.bu.edu <- tolsun.oulu.fi)" do |msg|
    msg.nick= "David"
    msg.kill_message= "(csd.bu.edu <- tolsun.oulu.fi)"
  end
end
