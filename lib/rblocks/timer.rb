# frozen_string_literal: true

module RBlock
  #
  # RBlock::Timer is a simple Go inspired timer. Usage
  # timer = RBlock::Timer.new(10)
  # timer.wait do
  #   # ... someting once the time is up
  # end
  #
  class Timer
    NAME = "r block timer"
    #
    # Constructs and starts a timer
    # @param duration [Numeric] duration in seconds
    #
    def initialize(duration)
      @ractor = Ractor.new(duration, NAME) do |time|
        sleep(time)

        Ractor.yield(:done)
      end
    end

    #
    # Blocks until the timer is done. Yields self to block if one is given
    #
    def wait
      done = @ractor.take
      yield(self) if block_given?
      done
    end
  end
end
