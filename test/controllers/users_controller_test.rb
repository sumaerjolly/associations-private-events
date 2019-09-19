# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: 'jolly')
  end

  test 'should get show' do
    get user_path(@user)
    assert_response :success
  end

  test 'should get new' do
    get new_user_path
    assert_response :success
  end
end
