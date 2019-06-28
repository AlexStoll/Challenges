# Circular buffer uses a single fixed size buffer
# Starts empty with some defined length
# [ ][ ][ ][ ] size = 4
# [ ][1][ ][ ] 1 written to buffer
# [3][1][2][ ] 2 and 3 written
# two elements are 'read' and removed
# => oldes elements are chosen
# [3][ ][ ][ ] just 3 remains, the newest element

# when buffer is full, an error is raised
# alerts that further writes are blocked until a slot opens
# Can overwrite the oldest data with a forced write


# seems possible to just use an array with a max size
class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  NIL_MESSAGE = "Can't write nil to buffer."

  def initialize(size)
    @buffer = []
    @size = size
  end

  def write(item)
    return NIL_MESSAGE if item == nil

    if buffer_not_full?
      @buffer << item
    else raise BufferFullException, "Use #write! to overwrite oldest item." # rescue thing here
    end
  end

  def read
    raise BufferEmptyException if buffer_empty?
    @buffer.shift
  end

  def clear
    @buffer = []
  end

  def write!(item)
    return NIL_MESSAGE if item == nil
    if buffer_full?
      overwrite(item)
    else
      self.write(item)
    end
  end

  private

  def buffer_full?
    @buffer.size >= @size
  end

  def buffer_not_full?
    @buffer.size < @size
  end

  def buffer_empty?
    @buffer.size == 0
  end

  def overwrite(item)
    @buffer.shift
    @buffer << item
  end
end

