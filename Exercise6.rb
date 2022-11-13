require './Exercise1.rb'
require 'test/unit'
class TestExercise1 < Test::Unit::TestCase
    def test_simple
        assert_equal(1, runExercise(10, [3,56,23,11,7,31,1,32,5,8]))
        assert_equal(3, runExercise(20, [100,54,3,10,4,5,7,57,-1,4,34,8,33,45,21,26,12,32,88,93]))
    end
    def test_typecheck
        assert_raise( ArgumentError ) { runExercise('10', [45,145,23,678,71,3,13,32,5,8]) }
        assert_raise( ArgumentError ) { runExercise('or10', [45,145,23,678,71,3,13,32,5,8]) }
        assert_raise( ArgumentError ) { runExercise(10, [45,145,23,'678',71,3,13,32,5,8]) }
        assert_raise( ArgumentError ) { runExercise('1', ['1 con vit']) }
        assert_raise( ArgumentError ) { runExercise(1, ['1']) }
        assert_raise( ArgumentError ) { runExercise('10', [45,145,23,678,71,3,13,32,5,8]) }
        assert_raise( ArgumentError ) { runExercise(8, [45,145,23,678,71,3,13,32,5,8]) }
        assert_raise( RangeError ) { runExercise(0, []) }
        assert_raise( RangeError ) { runExercise(8, [45,-2,23,678,71,3,13,32]) }
    end
    def test_failure
        assert_not_equal(-1, runExercise(8, [45,-1,23,678,71,3,13,32]))
        assert_not_equal(3, runExercise(8, [45,-1,23,678,71,3,13,32]))
    end
end