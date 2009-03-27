require 'test/test_helper'

class SystemTest < Test::Unit::TestCase
  context 'When writing to System.out' do
    setup do
      capture_io {
        System.out.println("HI")
      }
    end
    should 'should write to stdout' do
      assert_equal @out, "HI\n"
    end
    should 'not write to stderr' do
      assert_equal '', @err
    end
  end

  context 'Writing to System.err' do
    setup do
      capture_io {
        System.err.println("ERR")
      }
    end
    should 'not write to standard output' do
      assert_equal "", @out
    end
    should 'write to standard error' do
      assert_equal "ERR\n", @err
    end
  end

  private

  def capture_io
    @old_stdout = $stdout
    @old_stderr = $stderr
    $stdout = StringIO.new
    $stderr = StringIO.new
    yield
    @out = $stdout.string
    @err = $stderr.string
  ensure
    $stdout = @old_stdout
    $stderr = @old_stderr
  end
end
