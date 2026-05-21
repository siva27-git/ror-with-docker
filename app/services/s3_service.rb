class S3Service
  def initialize
    @client = Aws::S3::Client.new(
      region: ENV.fetch("REGION"),
      access_key_id: ENV.fetch("ACCESS_KEY_ID"),
      secret_access_key: ENV.fetch("SECRET_ACCESS_KEY_ID")
    )
    @bucket = ENV.fetch("BUCKET_NAME")
  end

  def upload(file, key)
    @client.put_object(bucket: @bucket, key: key, body: file)
    key
  end

  def fetch(key)
    response = @client.get_object(bucket: @bucket, key: key)
    response.body.read
  end

  def presigned_url(key)
    signer = Aws::S3::Presigner.new(client: @client)
    signer.presigned_url(:get_object, bucket: @bucket, key: key, expires_in: 3600)
  end
end
