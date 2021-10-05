# frozen_string_literal: true

require "test_helper"
require "r_blocks/timer"

module RBlock
  class TimerTest < Minitest::Test
    def test_construct_timer
      assert Timer.new(10).is_a?(Timer)
    end

    def test_wait_return
      assert_equal :done, Timer.new(0.01).wait
    end

    def test_wait_with_a_block
      x = 2
      Timer.new(0.01).wait { x += 2 }

      assert_equal 4, x
    end

    def test_wait_passage_of_time
      t = Process.clock_gettime(Process::CLOCK_MONOTONIC)

      Timer.new(0.02).wait
      assert Process.clock_gettime(Process::CLOCK_MONOTONIC) - t > 0.02
    end
  end
end
