require 'test_helper'

class DbAdminControllerTest < ActionController::TestCase
  test "should get mesactual" do
    get :mesactual
    assert_response :success
  end

  test "should get ultimomes" do
    get :ultimomes
    assert_response :success
  end

  test "should get anoactual" do
    get :anoactual
    assert_response :success
  end

  test "should get daterange" do
    get :daterange
    assert_response :success
  end

  test "should get generalstat" do
    get :generalstat
    assert_response :success
  end

  test "should get dispositivostat" do
    get :dispositivostat
    assert_response :success
  end

  test "should get sedestat" do
    get :sedestat
    assert_response :success
  end

end
