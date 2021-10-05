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
    class ErrorTerminated < StandardError; end

    NAME = "r block ticker"
    #
    # Constructs and starts a ticker
    # @param interval [Numeric] interval duration in seconds
    #
    def initialize(interval)
      @stop_ractor = Ractor.new { loop { Ractor.yield(Ractor.recv, move: true) } }

      @ractor = Ractor.new(interval, @stop_ractor, name: NAME) do |i, stop|
        loop do
          r, = Ractor.select(stop, send(nil))
          break if r == stop

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
    rescue Ractor::ClosedError => e
      raise ErrorTerminated, "ticker stopped"
    end

    # Stops the ticker. Calls to #wait
    def stop!
      @stop_ractor.send(:stop) and loop { break unless wait }
    end
  end
end
