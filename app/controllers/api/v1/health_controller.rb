module Api
  module V1
    class HealthController < ApplicationController
      def show
        render json: {
          status: "ok",
          version: "v1",
          service: "ror-with-docker",
          timestamp: Time.current.iso8601
        }, status: :ok
      end
    end
  end
end
