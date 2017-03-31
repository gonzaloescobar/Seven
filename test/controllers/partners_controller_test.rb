require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partner = partners(:one)
  end

  test "should get index" do
    get partners_url
    assert_response :success
  end

  test "should get new" do
    get new_partner_url
    assert_response :success
  end

  test "should create partner" do
    assert_difference('Partner.count') do
      post partners_url, params: { partner: { dni: @partner.dni, first_name: @partner.first_name, last_name: @partner.last_name } }
    end

    assert_redirected_to partner_url(Partner.last)
  end

  test "should show partner" do
    get partner_url(@partner)
    assert_response :success
  end

  test "should get edit" do
    get edit_partner_url(@partner)
    assert_response :success
  end

  test "should update partner" do
    patch partner_url(@partner), params: { partner: { dni: @partner.dni, first_name: @partner.first_name, last_name: @partner.last_name } }
    assert_redirected_to partner_url(@partner)
  end

  test "should destroy partner" do
    assert_difference('Partner.count', -1) do
      delete partner_url(@partner)
    end

    assert_redirected_to partners_url
  end
end
