require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "Alice", email: "alice@example.com")
  end

  teardown do
    User.delete_all
  end

  # POST /api/v1/users
  test "creates a user with valid params" do
    post "/api/v1/users", params: { user: { name: "Bob", email: "bob@example.com" } }, as: :json
    assert_response :created
    body = response.parsed_body
    assert_equal "Bob", body["name"]
    assert_equal "bob@example.com", body["email"]
    assert body["id"].present?
  end

  test "returns 422 when name is missing" do
    post "/api/v1/users", params: { user: { email: "no-name@example.com" } }, as: :json
    assert_response :unprocessable_entity
    assert_includes response.parsed_body["errors"], "Name can't be blank"
  end

  test "returns 422 when email is missing" do
    post "/api/v1/users", params: { user: { name: "NoEmail" } }, as: :json
    assert_response :unprocessable_entity
    assert_includes response.parsed_body["errors"], "Email can't be blank"
  end

  test "returns 422 when email is invalid" do
    post "/api/v1/users", params: { user: { name: "Bad", email: "not-an-email" } }, as: :json
    assert_response :unprocessable_entity
    assert response.parsed_body["errors"].any? { |e| e.include?("Email") }
  end

  test "returns 422 when email is duplicate" do
    post "/api/v1/users", params: { user: { name: "Dup", email: "alice@example.com" } }, as: :json
    assert_response :unprocessable_entity
    assert_includes response.parsed_body["errors"], "Email has already been taken"
  end

  # GET /api/v1/users/:id
  test "returns a user by id" do
    get "/api/v1/users/#{@user.id}"
    assert_response :ok
    body = response.parsed_body
    assert_equal @user.id, body["id"]
    assert_equal "Alice", body["name"]
    assert_equal "alice@example.com", body["email"]
  end

  test "returns 404 for unknown user" do
    get "/api/v1/users/0"
    assert_response :not_found
    assert_equal "User not found", response.parsed_body["error"]
  end
end
