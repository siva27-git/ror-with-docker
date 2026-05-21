class HealthController < ApplicationController
  def show
    Rails.logger.info "[HealthCheck] Request received from #{request.remote_ip} (#{request.user_agent})"

    response_body = { status: "ok", service: "ror-with-docker" }
    Rails.logger.info "[HealthCheck] Responding with status=ok"

    render json: response_body, status: :ok
  end
end
