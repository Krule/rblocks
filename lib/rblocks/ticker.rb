# frozen_string_literal: true

module RBlock
  #
  # RBlock::Ticker is a simple Go inspired ticker. Usage
  # ticker = RBlock::Ticker.new(0.5)
  # 10.times do
  #   ticker.wait # blocks for 1/2s
  #   # do a thing every 1/2s
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
