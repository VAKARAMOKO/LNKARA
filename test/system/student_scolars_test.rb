require "application_system_test_case"

class StudentScolarsTest < ApplicationSystemTestCase
  setup do
    @student_scolar = student_scolars(:one)
  end

  test "visiting the index" do
    visit student_scolars_url
    assert_selector "h1", text: "Student Scolars"
  end

  test "creating a Student scolar" do
    visit student_scolars_url
    click_on "New Student Scolar"

    fill_in "Status", with: @student_scolar.status
    fill_in "Student", with: @student_scolar.student_id
    fill_in "Total", with: @student_scolar.total
    click_on "Create Student scolar"

    assert_text "Student scolar was successfully created"
    click_on "Back"
  end

  test "updating a Student scolar" do
    visit student_scolars_url
    click_on "Edit", match: :first

    fill_in "Status", with: @student_scolar.status
    fill_in "Student", with: @student_scolar.student_id
    fill_in "Total", with: @student_scolar.total
    click_on "Update Student scolar"

    assert_text "Student scolar was successfully updated"
    click_on "Back"
  end

  test "destroying a Student scolar" do
    visit student_scolars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student scolar was successfully destroyed"
  end
end
