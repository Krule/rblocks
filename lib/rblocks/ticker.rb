# frozen_string_literal: true

module RBlock
  #
  # RBlock::Timer is a simple Go inspired timer. Usage
  # timer = RBlock::Timer.new(10)
  # timer.wait do
  #   # ... someting once the time is up
  # end
  #
  class Ticker
    NAME = "r block ticker"
    #
    # Constructs and starts a ticker
    # @param interval [Numeric] interval duration in seconds
    #
    def initialize(interval)
      @ractor = Ractor.new(interval) do |i|
        loop do
          sleep(i)
          Ractor.yield(Time.now)
        end
      end
    end

    # Blocks until ractor yields and than yields and returns
    def wait
      t = @ractor.take
      yield(self) if block_given?
      t
    end
  end
end
