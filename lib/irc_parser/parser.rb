
# line 1 "lib/irc_parser/parser.rl"

# line 45 "lib/irc_parser/parser.rl"


module IRCParser
  class ParserError < RuntimeError; end

  
# line 12 "lib/irc_parser/parser.rb"
class << self
	attr_accessor :_irc_parser_trans_keys
	private :_irc_parser_trans_keys, :_irc_parser_trans_keys=
end
self._irc_parser_trans_keys = [
	0, 0, 48, 122, 48, 57, 
	48, 57, 13, 32, 10, 
	10, 1, 127, 1, 127, 
	1, 127, -128, 13, -128, -65, 
	-128, 13, -128, -65, -128, 
	-65, 45, 122, 32, 122, 
	32, 122, 13, 122, 32, 126, 
	1, 127, 1, 127, 45, 
	122, 32, 126, 0, 0, 
	0
]

class << self
	attr_accessor :_irc_parser_key_spans
	private :_irc_parser_key_spans, :_irc_parser_key_spans=
end
self._irc_parser_key_spans = [
	0, 75, 10, 10, 20, 1, 127, 127, 
	127, 142, 64, 142, 64, 64, 78, 91, 
	91, 110, 95, 127, 127, 78, 95, 0
]

class << self
	attr_accessor :_irc_parser_index_offsets
	private :_irc_parser_index_offsets, :_irc_parser_index_offsets=
end
self._irc_parser_index_offsets = [
	0, 0, 76, 87, 98, 119, 121, 249, 
	377, 505, 648, 713, 856, 921, 986, 1065, 
	1157, 1249, 1360, 1456, 1584, 1712, 1791, 1887
]

class << self
	attr_accessor :_irc_parser_indicies
	private :_irc_parser_indicies, :_irc_parser_indicies=
end
self._irc_parser_indicies = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 2, 1, 1, 1, 1, 1, 
	1, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 1, 1, 1, 1, 1, 
	1, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 1, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 1, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 1, 6, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 7, 1, 8, 
	1, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 1, 9, 9, 10, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	11, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 12, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	1, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 1, 13, 13, 14, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	15, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	13, 13, 13, 13, 13, 13, 13, 13, 
	1, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 1, 9, 9, 1, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	16, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 12, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 17, 17, 17, 17, 17, 17, 17, 
	17, 18, 18, 18, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 18, 18, 18, 
	18, 19, 19, 19, 19, 19, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 20, 20, 20, 20, 20, 20, 
	20, 20, 20, 1, 20, 20, 21, 20, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 22, 22, 22, 22, 22, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 25, 25, 25, 25, 25, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 22, 22, 22, 22, 22, 22, 
	22, 22, 22, 1, 22, 22, 14, 22, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	23, 23, 23, 23, 23, 23, 23, 23, 
	1, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 24, 24, 24, 24, 24, 24, 24, 
	24, 1, 26, 26, 1, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 1, 
	1, 1, 1, 1, 1, 1, 27, 27, 
	27, 27, 27, 27, 27, 27, 27, 27, 
	27, 27, 27, 27, 27, 27, 27, 27, 
	27, 27, 27, 27, 27, 27, 27, 27, 
	1, 1, 1, 1, 1, 1, 27, 27, 
	27, 27, 27, 27, 27, 27, 27, 27, 
	27, 27, 27, 27, 27, 27, 27, 27, 
	27, 27, 27, 27, 27, 27, 27, 27, 
	1, 28, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 29, 29, 
	1, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 1, 1, 1, 1, 1, 
	1, 1, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 1, 1, 1, 1, 
	1, 1, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 1, 30, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 1, 
	1, 1, 1, 1, 1, 1, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	1, 1, 1, 1, 1, 1, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	1, 6, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 7, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 1, 
	1, 1, 1, 1, 1, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 1, 
	28, 32, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 33, 29, 1, 
	33, 33, 33, 33, 33, 33, 33, 33, 
	33, 33, 1, 1, 1, 1, 1, 1, 
	34, 33, 33, 33, 33, 33, 33, 33, 
	33, 33, 33, 33, 33, 33, 33, 33, 
	33, 33, 33, 33, 33, 33, 33, 33, 
	33, 33, 33, 35, 35, 35, 35, 35, 
	35, 33, 33, 33, 33, 33, 33, 33, 
	33, 33, 33, 33, 33, 33, 33, 33, 
	33, 33, 33, 33, 33, 33, 33, 33, 
	33, 33, 33, 35, 1, 35, 35, 1, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 1, 36, 36, 1, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 1, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 1, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 1, 36, 36, 1, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 28, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 36, 
	36, 36, 36, 36, 36, 36, 36, 1, 
	29, 29, 1, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 1, 1, 1, 
	1, 1, 1, 1, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 1, 1, 
	1, 1, 1, 1, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 1, 28, 
	32, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 35, 1, 1, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 1, 1, 1, 1, 1, 1, 34, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 35, 35, 35, 35, 35, 
	35, 35, 35, 1, 35, 35, 1, 1, 
	0
]

class << self
	attr_accessor :_irc_parser_trans_targs
	private :_irc_parser_trans_targs, :_irc_parser_trans_targs=
end
self._irc_parser_trans_targs = [
	2, 0, 14, 17, 3, 4, 5, 6, 
	23, 7, 5, 6, 9, 7, 5, 8, 
	8, 10, 12, 13, 11, 5, 11, 10, 
	12, 13, 15, 18, 16, 15, 16, 17, 
	19, 18, 21, 22, 20
]

class << self
	attr_accessor :_irc_parser_trans_actions
	private :_irc_parser_trans_actions, :_irc_parser_trans_actions=
end
self._irc_parser_trans_actions = [
	1, 0, 0, 1, 0, 0, 2, 2, 
	0, 1, 0, 0, 0, 0, 3, 3, 
	0, 1, 1, 1, 1, 4, 0, 0, 
	0, 0, 1, 1, 5, 0, 0, 0, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :irc_parser_start
end
self.irc_parser_start = 1;
class << self
	attr_accessor :irc_parser_first_final
end
self.irc_parser_first_final = 23;
class << self
	attr_accessor :irc_parser_error
end
self.irc_parser_error = 0;

class << self
	attr_accessor :irc_parser_en_main
end
self.irc_parser_en_main = 1;


# line 51 "lib/irc_parser/parser.rl"

  CLASS_FROM_PARSE = Hash.new { |h,k| h[k] = Messages::ALL[k] } # This hash will be smaller than Messages::ALL, and hence faster.

  def parse(message)
    data = message.unpack("c*")

    prefix, command, params = nil, nil, []

    
# line 347 "lib/irc_parser/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = irc_parser_start
end

# line 60 "lib/irc_parser/parser.rl"
    
# line 356 "lib/irc_parser/parser.rb"
begin
	testEof = false
	_slen, _trans, _keys, _inds, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = cs << 1
	_inds = _irc_parser_index_offsets[cs]
	_slen = _irc_parser_key_spans[cs]
	_trans = if (   _slen > 0 && 
			_irc_parser_trans_keys[_keys] <= data[p] && 
			data[p] <= _irc_parser_trans_keys[_keys + 1] 
		    ) then
			_irc_parser_indicies[ _inds + data[p] - _irc_parser_trans_keys[_keys] ] 
		 else 
			_irc_parser_indicies[ _inds + _slen ]
		 end
	cs = _irc_parser_trans_targs[_trans]
	if _irc_parser_trans_actions[_trans] != 0
	case _irc_parser_trans_actions[_trans]
	when 1 then
# line 32 "lib/irc_parser/parser.rl"
		begin
 mark = p 		end
	when 5 then
# line 33 "lib/irc_parser/parser.rl"
		begin
 prefix = data[mark..(p-1)].pack("c*") 		end
	when 2 then
# line 34 "lib/irc_parser/parser.rl"
		begin
 command = data[mark..(p-1)].pack("c*") 		end
	when 3 then
# line 35 "lib/irc_parser/parser.rl"
		begin
 params << data[mark..(p-1)].pack("c*") 		end
	when 4 then
# line 32 "lib/irc_parser/parser.rl"
		begin
 mark = p 		end
# line 35 "lib/irc_parser/parser.rl"
		begin
 params << data[mark..(p-1)].pack("c*") 		end
# line 415 "lib/irc_parser/parser.rb"
	end
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
end
	end

# line 61 "lib/irc_parser/parser.rl"

    if cs >= irc_parser_first_final
      klass = CLASS_FROM_PARSE[command]
      raise ParserError, "Message not recognized: #{message.inspect}" unless klass
      klass.new(prefix, params)
    elsif message !~ /\r\n$/
      raise ParserError, "Message must finish with \\r\\n"
    else
      raise ParserError, message
    end
  end

  def parse_raw(message)
    data = message.unpack("c*")

    prefix, command, params = nil, nil, []

    
# line 457 "lib/irc_parser/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = irc_parser_start
end

# line 79 "lib/irc_parser/parser.rl"
    
# line 466 "lib/irc_parser/parser.rb"
begin
	testEof = false
	_slen, _trans, _keys, _inds, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = cs << 1
	_inds = _irc_parser_index_offsets[cs]
	_slen = _irc_parser_key_spans[cs]
	_trans = if (   _slen > 0 && 
			_irc_parser_trans_keys[_keys] <= data[p] && 
			data[p] <= _irc_parser_trans_keys[_keys + 1] 
		    ) then
			_irc_parser_indicies[ _inds + data[p] - _irc_parser_trans_keys[_keys] ] 
		 else 
			_irc_parser_indicies[ _inds + _slen ]
		 end
	cs = _irc_parser_trans_targs[_trans]
	if _irc_parser_trans_actions[_trans] != 0
	case _irc_parser_trans_actions[_trans]
	when 1 then
# line 32 "lib/irc_parser/parser.rl"
		begin
 mark = p 		end
	when 5 then
# line 33 "lib/irc_parser/parser.rl"
		begin
 prefix = data[mark..(p-1)].pack("c*") 		end
	when 2 then
# line 34 "lib/irc_parser/parser.rl"
		begin
 command = data[mark..(p-1)].pack("c*") 		end
	when 3 then
# line 35 "lib/irc_parser/parser.rl"
		begin
 params << data[mark..(p-1)].pack("c*") 		end
	when 4 then
# line 32 "lib/irc_parser/parser.rl"
		begin
 mark = p 		end
# line 35 "lib/irc_parser/parser.rl"
		begin
 params << data[mark..(p-1)].pack("c*") 		end
# line 525 "lib/irc_parser/parser.rb"
	end
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
end
	end

# line 80 "lib/irc_parser/parser.rl"

    if cs >= irc_parser_first_final
      return prefix, command, params
    elsif message !~ /\r\n$/
      raise ParserError, "Message must finish with \\r\\n"
    else
      raise ParserError, message
    end
  end
end
