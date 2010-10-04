module IRCParser
  class Params < Array

    # Params is an array of values
    def initialize(defaults, params = nil)
      replace(defaults)
      params.each_with_index { |elem, index| self[index] = elem } if params
    end

    # Postfixes is the number of paremeters used to build the last parameter
    # The message has a number of postfixes, which are the paremeters to be
    # joined in the last parameter. This is because the RFC protocol only
    # allows blank on the last param.  All the parameters are joined by a
    # space.
    def to_s(minimum_postfixes = 0)
      if empty? || (self == [nil]) || (self == [""])
        ""
      else
        index_first_space = each_with_index { |val, index| break index if !val.nil? && val.to_s.index(" ") }
        mandatory_postfixes = index_first_space.is_a?(Numeric) ? (length - index_first_space) : 0
        postfixes = minimum_postfixes > mandatory_postfixes ? minimum_postfixes : mandatory_postfixes

        prefix, postfix = self[0, length - postfixes], self[-postfixes, postfixes]
        prefix.delete(nil); postfix.delete(nil)

        "#{" " unless prefix.empty?}#{prefix.join(" ")}#{" :" unless postfix.empty?}#{postfix.join(" ")}"
      end
    end
  end
end
