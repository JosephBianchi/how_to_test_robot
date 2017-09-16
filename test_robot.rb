require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # skip
    # arrange
    robot = Robot.new
    robot.foreign_model = true
    robot.needs_repairs = true
    # act
    output = robot.station
    # assert
    assert_equal(1, output)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # skip
    # arrange
    robot = Robot.new
    robot.vintage_model = true
    robot.needs_repairs = true
    # act
    output = robot.station
    # assert
    assert_equal(2, output)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    # act
    output = robot.station
    # assert
    assert_equal(3, output)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = false
    # act
    output = robot.station
    # assert
    assert_equal(4, output)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = false
    # act
    output = robot.prioritize_tasks
    # assert
    assert_equal(-1, output)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.todos = [1, 3, 2]
    # act
    output = robot.prioritize_tasks
    # assert
    assert_equal(3, output)
  end

  def test_workday_on_day_off_returns_false
    # skip
    # arrange
    robot = Robot.new
    robot.day_off = "sat"
    # act
    output = robot.workday?("sat")
    # assert
    assert_equal(false, output)
  end

  def test_workday_not_day_off_returns_true
    # skip
    # arrange
    robot = Robot.new
    robot.day_off = "sat"
    # act
    output = robot.workday?("mon")
    # assert
    assert_equal(true, output)
  end

end
