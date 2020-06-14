require "application_system_test_case"

class DdaysTest < ApplicationSystemTestCase
  setup do
    @dday = ddays(:one)
  end

  test "visiting the index" do
    visit ddays_url
    assert_selector "h1", text: "Ddays"
  end

  test "creating a Dday" do
    visit ddays_url
    click_on "New Dday"

    click_on "Create Dday"

    assert_text "Dday was successfully created"
    click_on "Back"
  end

  test "updating a Dday" do
    visit ddays_url
    click_on "Edit", match: :first

    click_on "Update Dday"

    assert_text "Dday was successfully updated"
    click_on "Back"
  end

  test "destroying a Dday" do
    visit ddays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dday was successfully destroyed"
  end
end
