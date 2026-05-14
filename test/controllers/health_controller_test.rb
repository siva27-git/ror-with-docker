require "test_helper"

class HealthControllerTest < ActionDispatch::IntegrationTest
  test "GET /health returns 200" do
    get "/health"
    assert_response :ok
  end

  test "GET /health returns JSON content type" do
    get "/health"
    assert_equal "application/json; charset=utf-8", response.content_type
  end

  test "GET /health returns expected body" do
    get "/health"
    body = response.parsed_body
    assert_equal "ok", body["status"]
    assert_equal "ror-with-docker", body["service"]
  end

  test "api/v1/health route no longer exists" do
    get "/api/v1/health"
    assert_response :not_found
  end
end
