%%{
  machine irc_parser;

  NUL = '\0';
  BELL = '\a';
  CR = '\r';
  LF = '\n';
  SPACE = ' '+;

  crlf = CR LF;
  comma = ',';
  nonwhite = ascii -- (SPACE | NUL | CR | LF);
  special = ('_' | '-' | '[' | ']' | '\\' | '`' | '^' | '{' | '}');

  chstring = ascii -- (SPACE | BELL | NUL | CR | LF | comma);
  mask = ('#' | '$') chstring;
  nick = alpha (alpha | digit | special)*;
  host = (alpha | digit | '-' | '.')+;
  servername = host;
  channel = ('#' | '&') chstring;
  user = nonwhite+;
  to_ = channel | (user '@' servername) | nick | mask;
  target = to_ (',' to_)*;

  action mark { mark = p }
  action prefix { prefix = data[mark..(p-1)] }
  action command { command = data[mark..(p-1)] }
  action params { params << data[mark..(p-1)] }

  trailing = ( ascii -- (NUL | CR | LF) )* >mark %params;
  middle = ( (nonwhite - ':') nonwhite* ) >mark %params;
  params = SPACE? (SPACE middle)* (SPACE ':' trailing)?;
  command = (alpha+ | digit digit digit) >mark %command;
  prefix = (servername | nick ('!' user)? ('@' host)?) >mark %prefix;
  message = (':' prefix SPACE)? command params crlf;

  main := message;
}%%

module IRCParser
  class Parser
    class Error < RuntimeError
      attr_accessor :source, :prefix, :identifier, :params

      def initialize(source, prefix, identifier, params)
        @source, @prefix, @identifier, @params = source, prefix, identifier, params
      end

      def to_s
        "Failed to parse #{source.inspect}"
      end
      alias_method :message, :to_s
    end

    %% write data;

    def self.run(message)
      data = message.unpack("c*") if message.is_a?(String)

      prefix = nil
      command = nil
      params = []

      %% write init;
      %% write exec;

      if cs >= irc_parser_first_final
        prefix = prefix.pack("c*") if prefix
        command = command.pack("c*") if command
        params = params.map { |a| a.pack("c*") } if params
        return prefix, command, *params
      else
        raise IRCParser::Parser::Error.new(message, prefix, command, params)
      end
    end

  end
end