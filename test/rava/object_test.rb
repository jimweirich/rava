require 'test/test_helper'

class TestObject < Test::Unit::TestCase
  class Thing
    def some_kind_of_method
      :hi
    end
  end

  context 'With a Thing' do
    setup do
      @thing = Thing.new
    end
    
    context 'calling a underscore method' do
      should 'return the proper value' do
        assert_equal :hi, @thing.some_kind_of_method
      end
    end

    context 'calling a camelcase method' do
      should 'return the proper value' do
        assert_equal :hi, @thing.someKindOfMethod
      end
    end

    context 'calling an unknown method' do
      should 'raise a NoMethod error' do
        assert_raise(NoMethodError) do
          @thing.not_defined
        end
      end
    end

    context 'calling an unknown camel case method' do
      should 'raise a NoMethod error' do
        assert_raise(NoMethodError) do
          @thing.notDefined
        end
      end
    end
  end

  context 'Creating a Thing' do
    context 'with the new function' do
      should 'create a thing' do
        t = new Thing
        assert_not_nil t
      end      
    end
  end

  context 'Converting to CamelCase' do
    should 'convert all the examples' do
      assert_equal "a", rava_case("a")
      assert_equal "aa_bb", rava_case("aaBb")
      assert_equal "aa_bb_cc", rava_case("aaBbCc")
      assert_equal "aa_controller", rava_case("aaController")
      assert_equal "an_abccontroller", rava_case("anABCController")
    end
  end
end
