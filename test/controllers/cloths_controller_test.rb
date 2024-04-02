require "test_helper"

class ClothsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cloth = cloths(:one)
  end

  test "should get index" do
    get cloths_url
    assert_response :success
  end

  test "should get new" do
    get new_cloth_url
    assert_response :success
  end

  test "should create cloth" do
    assert_difference("Cloth.count") do
      post cloths_url, params: { cloth: { cost: @cloth.cost, description: @cloth.description, location_id: @cloth.location_id, name: @cloth.name } }
    end

    assert_redirected_to cloth_url(Cloth.last)
  end

  test "should show cloth" do
    get cloth_url(@cloth)
    assert_response :success
  end

  test "should get edit" do
    get edit_cloth_url(@cloth)
    assert_response :success
  end

  test "should update cloth" do
    patch cloth_url(@cloth), params: { cloth: { cost: @cloth.cost, description: @cloth.description, location_id: @cloth.location_id, name: @cloth.name } }
    assert_redirected_to cloth_url(@cloth)
  end

  test "should destroy cloth" do
    assert_difference("Cloth.count", -1) do
      delete cloth_url(@cloth)
    end

    assert_redirected_to cloths_url
  end
end
