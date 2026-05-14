class HealthController < ApplicationController
  def show
    render json: { status: "ok", service: "ror-with-docker" }, status: :ok
  end
end
