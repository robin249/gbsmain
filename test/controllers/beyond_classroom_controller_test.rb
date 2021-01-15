require 'test_helper'

class BeyondClassroomControllerTest < ActionDispatch::IntegrationTest
  test "should get sport" do
    get beyond_classroom_sport_url
    assert_response :success
  end

  test "should get curriculum" do
    get beyond_classroom_curriculum_url
    assert_response :success
  end

  test "should get art" do
    get beyond_classroom_art_url
    assert_response :success
  end

  test "should get exchange_program" do
    get beyond_classroom_exchange_program_url
    assert_response :success
  end

  test "should get study_tour" do
    get beyond_classroom_study_tour_url
    assert_response :success
  end

end
