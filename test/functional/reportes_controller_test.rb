require 'test_helper'

class ReportesControllerTest < ActionController::TestCase
  test "should get filtrar" do
    get :filtrar
    assert_response :success
  end

  test "should get descargar" do
    get :descargar
    assert_response :success
  end

  test "should get generar" do
    get :generar
    assert_response :success
  end

end
