require 'test_helper'

class UserSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_schedule = user_schedules(:one)
  end

  test "should get index" do
    get user_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_user_schedule_url
    assert_response :success
  end

  test "should create user_schedule" do
    assert_difference('UserSchedule.count') do
      post user_schedules_url, params: { user_schedule: { attended: @user_schedule.attended, schedule_id: @user_schedule.schedule_id, user_id: @user_schedule.user_id, user_notes: @user_schedule.user_notes } }
    end

    assert_redirected_to user_schedule_url(UserSchedule.last)
  end

  test "should show user_schedule" do
    get user_schedule_url(@user_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_schedule_url(@user_schedule)
    assert_response :success
  end

  test "should update user_schedule" do
    patch user_schedule_url(@user_schedule), params: { user_schedule: { attended: @user_schedule.attended, schedule_id: @user_schedule.schedule_id, user_id: @user_schedule.user_id, user_notes: @user_schedule.user_notes } }
    assert_redirected_to user_schedule_url(@user_schedule)
  end

  test "should destroy user_schedule" do
    assert_difference('UserSchedule.count', -1) do
      delete user_schedule_url(@user_schedule)
    end

    assert_redirected_to user_schedules_url
  end
end
