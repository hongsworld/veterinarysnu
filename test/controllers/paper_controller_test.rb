require 'test_helper'

class PaperControllerTest < ActionController::TestCase
  test "should get neodin" do
    get :neodin
    assert_response :success
  end

  test "should get snu" do
    get :snu
    assert_response :success
  end

end
