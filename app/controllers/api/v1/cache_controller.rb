module Api
  module V1
    class CacheController < ApplicationController
      # GET /api/v1/cache/:key
      def show
        value = CacheService.get(params[:key])
        if value.nil?
          render json: { error: "Key not found" }, status: :not_found
        else
          render json: { key: params[:key], value: value }, status: :ok
        end
      end

      # POST /api/v1/cache
      # Body: { key: "foo", value: "bar", ttl: 3600 }
      def create
        key   = cache_params[:key]
        value = cache_params[:value]
        ttl   = cache_params[:ttl]

        CacheService.set(key, value, ttl: ttl)
        render json: { key: key, value: value, ttl: ttl }, status: :created
      end

      # DELETE /api/v1/cache/:key
      def destroy
        CacheService.delete(params[:key])
        render json: { message: "Deleted" }, status: :ok
      end

      private

      def cache_params
        params.expect(cache: [ :key, :value, :ttl ])
      end
    end
  end
end
