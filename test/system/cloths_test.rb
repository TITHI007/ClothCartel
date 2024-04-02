require "application_system_test_case"

class ClothsTest < ApplicationSystemTestCase
  setup do
    @cloth = cloths(:one)
  end

  test "visiting the index" do
    visit cloths_url
    assert_selector "h1", text: "Cloths"
  end

  test "should create cloth" do
    visit cloths_url
    click_on "New cloth"

    fill_in "Cost", with: @cloth.cost
    fill_in "Description", with: @cloth.description
    fill_in "Location", with: @cloth.location_id
    fill_in "Name", with: @cloth.name
    click_on "Create Cloth"

    assert_text "Cloth was successfully created"
    click_on "Back"
  end

  test "should update Cloth" do
    visit cloth_url(@cloth)
    click_on "Edit this cloth", match: :first

    fill_in "Cost", with: @cloth.cost
    fill_in "Description", with: @cloth.description
    fill_in "Location", with: @cloth.location_id
    fill_in "Name", with: @cloth.name
    click_on "Update Cloth"

    assert_text "Cloth was successfully updated"
    click_on "Back"
  end

  test "should destroy Cloth" do
    visit cloth_url(@cloth)
    click_on "Destroy this cloth", match: :first

    assert_text "Cloth was successfully destroyed"
  end
end
