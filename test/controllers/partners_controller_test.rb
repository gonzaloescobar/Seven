require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @partner = partners(:one)
    @partner2 = Partner.new(first_name: "Partner name", last_name: "Partner name", dni: "dni")
  end

  test "should get index" do
    get partners_url
    assert_response :success
  end

  test "should get new" do
    get new_partner_url
    assert_response :success
  end

  #test "should create partner" do
  #  assert_difference('Partner.count') do
  #    post partners_url, params: { partner: { first_name: @partner2.first_name } }
  #  end
  #  assert_redirected_to partners_url
  #end

  test "should show partner" do
    get partner_url(@partner)
    assert_response :success
  end

  #test "should get edit" do
  #  get edit_partners_url(@partner)
  #  assert_response :success
  #end

  #test "should update partner" do
  #  patch partner_url(@partner), params: { partner: { name: @partner.name } }
  #  assert_redirected_to partners_url
  #end

  #test "should destroy partner" do
  #  assert_difference('Partner.count', -1) do
  #    delete partner_url(@partner)
  #  end

  #  assert_redirected_to partners_url
  #end
end
