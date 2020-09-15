require 'test_helper'

class ScolarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scolar = scolars(:one)
  end

  test "should get index" do
    get scolars_url
    assert_response :success
  end

  test "should get new" do
    get new_scolar_url
    assert_response :success
  end

  test "should create scolar" do
    assert_difference('Scolar.count') do
      post scolars_url, params: { scolar: { status: @scolar.status, student_id: @scolar.student_id, total: @scolar.total } }
    end

    assert_redirected_to scolar_url(Scolar.last)
  end

  test "should show scolar" do
    get scolar_url(@scolar)
    assert_response :success
  end

  test "should get edit" do
    get edit_scolar_url(@scolar)
    assert_response :success
  end

  test "should update scolar" do
    patch scolar_url(@scolar), params: { scolar: { status: @scolar.status, student_id: @scolar.student_id, total: @scolar.total } }
    assert_redirected_to scolar_url(@scolar)
  end

  test "should destroy scolar" do
    assert_difference('Scolar.count', -1) do
      delete scolar_url(@scolar)
    end

    assert_redirected_to scolars_url
  end
end
