# Takes a decimal number
# converts it to the appropriate sequence of events
# for a secret handshake
# 1 = wink
# 10 = double blink
# 100 = close eyes
# 10000 = jump

# 10000 = reverse order of operations

# handshake = SecretHandshake.new(9) => 1001 in binary => wink, jump
# So you can pass a decimal number, convert to binary, then do the things

# handshake = SecretHandshake.new("11001") => jump, wink
# over 10000, so reverse order, then 1001 => wink, jump

class SecretHandshake
  COMMAND_LIST = {
    10000 => 'reverse',
    1000  => 'jump',
    100   => 'close your eyes',
    10    => 'double blink',
    1     => 'wink',
  }

  def initialize(input)
    input.class == String ? 
      @code = input.to_i : 
      @code = input.to_s(2).to_i
  end

  def commands
    output = []
    COMMAND_LIST.each do |key, action|
      times = @code / key
      output << action * times
      @code = @code % key
    end
    output.reverse! unless output.include?('reverse')
    # this is because it builds the output in an already 'reversed' order
    output.select {|x| x != "" && x != "reverse"}
  end
end
