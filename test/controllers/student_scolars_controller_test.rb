require 'test_helper'

class StudentScolarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_scolar = student_scolars(:one)
  end

  test "should get index" do
    get student_scolars_url
    assert_response :success
  end

  test "should get new" do
    get new_student_scolar_url
    assert_response :success
  end

  test "should create student_scolar" do
    assert_difference('StudentScolar.count') do
      post student_scolars_url, params: { student_scolar: { status: @student_scolar.status, student_id: @student_scolar.student_id, total: @student_scolar.total } }
    end

    assert_redirected_to student_scolar_url(StudentScolar.last)
  end

  test "should show student_scolar" do
    get student_scolar_url(@student_scolar)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_scolar_url(@student_scolar)
    assert_response :success
  end

  test "should update student_scolar" do
    patch student_scolar_url(@student_scolar), params: { student_scolar: { status: @student_scolar.status, student_id: @student_scolar.student_id, total: @student_scolar.total } }
    assert_redirected_to student_scolar_url(@student_scolar)
  end

  test "should destroy student_scolar" do
    assert_difference('StudentScolar.count', -1) do
      delete student_scolar_url(@student_scolar)
    end

    assert_redirected_to student_scolars_url
  end
end
