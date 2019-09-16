require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "jolly")
  end 

  test "user should be valid" do 
    assert @user.valid?
  end

  test "name should be present" do 
    @user.name = " "
    assert_not @user.valid?
  end 

  test "name should be unique" do 
    @user.save
    user2 = User.new(name: "jolly")
    assert_not user2.valid?
  end 

  test "name should not be too long" do
    @user.name = "a" * 22 
    assert_not @user.valid?
  end 

  test "name should not be too short" do 
    @user.name = "aa"
    assert_not @user.valid?
  end

end
