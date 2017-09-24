require 'test_helper'

class ChatboxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatbox = chatboxes(:one)
  end

  test "should get index" do
    get chatboxes_url
    assert_response :success
  end

  test "should get new" do
    get new_chatbox_url
    assert_response :success
  end

  test "should create chatbox" do
    assert_difference('Chatbox.count') do
      post chatboxes_url, params: { chatbox: { msg: @chatbox.msg, type: @chatbox.type, userfrom: @chatbox.userfrom, userto: @chatbox.userto } }
    end

    assert_redirected_to chatbox_url(Chatbox.last)
  end

  test "should show chatbox" do
    get chatbox_url(@chatbox)
    assert_response :success
  end

  test "should get edit" do
    get edit_chatbox_url(@chatbox)
    assert_response :success
  end

  test "should update chatbox" do
    patch chatbox_url(@chatbox), params: { chatbox: { msg: @chatbox.msg, type: @chatbox.type, userfrom: @chatbox.userfrom, userto: @chatbox.userto } }
    assert_redirected_to chatbox_url(@chatbox)
  end

  test "should destroy chatbox" do
    assert_difference('Chatbox.count', -1) do
      delete chatbox_url(@chatbox)
    end

    assert_redirected_to chatboxes_url
  end
end
