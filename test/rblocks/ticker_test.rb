# frozen_string_literal: true

require "test_helper"
require "rblocks/ticker"

module RBlock
  class TickerTest < Minitest::Test
    def test_construct_ticker
      assert Ticker.new(1).is_a?(Ticker)
    end

    def test_tick
      assert Ticker.new(0.001).wait.is_a?(Time)
    end

    def test_tick_with_a_block
      t = nil
      Ticker.new(0.001).wait { |ticker| t = ticker }

      assert t.is_a?(Ticker)
    end

    def test_ticker_stop!
      ticker = Ticker.new(0.1)

      assert_nil(ticker.stop!)
    end

    def test_wait_when_ticker_stopped
      ticker = Ticker.new(0.1)
      ticker.stop!

      assert_raises(Ticker::ErrorTerminated) { ticker.wait }
    end
  end
end
