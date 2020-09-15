require "application_system_test_case"

class ScolarsTest < ApplicationSystemTestCase
  setup do
    @scolar = scolars(:one)
  end

  test "visiting the index" do
    visit scolars_url
    assert_selector "h1", text: "Scolars"
  end

  test "creating a Scolar" do
    visit scolars_url
    click_on "New Scolar"

    fill_in "Status", with: @scolar.status
    fill_in "Student", with: @scolar.student_id
    fill_in "Total", with: @scolar.total
    click_on "Create Scolar"

    assert_text "Scolar was successfully created"
    click_on "Back"
  end

  test "updating a Scolar" do
    visit scolars_url
    click_on "Edit", match: :first

    fill_in "Status", with: @scolar.status
    fill_in "Student", with: @scolar.student_id
    fill_in "Total", with: @scolar.total
    click_on "Update Scolar"

    assert_text "Scolar was successfully updated"
    click_on "Back"
  end

  test "destroying a Scolar" do
    visit scolars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scolar was successfully destroyed"
  end
end
