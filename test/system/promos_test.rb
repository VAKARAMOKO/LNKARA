require "application_system_test_case"

class PromosTest < ApplicationSystemTestCase
  setup do
    @promo = promos(:one)
  end

  test "visiting the index" do
    visit promos_url
    assert_selector "h1", text: "Promos"
  end

  test "creating a Promo" do
    visit promos_url
    click_on "New Promo"

    fill_in "Code school", with: @promo.code_school
    fill_in "Slug", with: @promo.slug
    fill_in "Title", with: @promo.title
    fill_in "User", with: @promo.user_id
    click_on "Create Promo"

    assert_text "Promo was successfully created"
    click_on "Back"
  end

  test "updating a Promo" do
    visit promos_url
    click_on "Edit", match: :first

    fill_in "Code school", with: @promo.code_school
    fill_in "Slug", with: @promo.slug
    fill_in "Title", with: @promo.title
    fill_in "User", with: @promo.user_id
    click_on "Update Promo"

    assert_text "Promo was successfully updated"
    click_on "Back"
  end

  test "destroying a Promo" do
    visit promos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Promo was successfully destroyed"
  end
end
