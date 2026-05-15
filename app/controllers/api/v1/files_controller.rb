module Api
  module V1
    class FilesController < ApplicationController
      def upload
        file = params.require(:file)
        key = "uploads/#{SecureRandom.uuid}/#{file.original_filename}"
        S3Service.new.upload(file.read, key)
        render json: { key: key }, status: :created
      end

      def fetch
        key = params.require(:key)
        url = S3Service.new.presigned_url(key)
        render json: { url: url }, status: :ok
      rescue Aws::S3::Errors::NoSuchKey
        render json: { error: "File not found" }, status: :not_found
      end
    end
  end
end
