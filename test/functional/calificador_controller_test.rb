require 'test_helper'

class CalificadorControllerTest < ActionController::TestCase
  test "should get calificador" do
    get :calificador
    assert_response :success
  end

  test "should get pregunta" do
    get :pregunta
    assert_response :success
  end

  test "should get personal" do
    get :personal
    assert_response :success
  end

end
