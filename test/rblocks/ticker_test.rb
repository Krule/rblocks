# frozen_string_literal: true

require "test_helper"
require "r_blocks/ticker"

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
      Ticker.new(0.001).wait { |time| t = time }

      assert t.is_a?(Ticker)
    end
  end
end
