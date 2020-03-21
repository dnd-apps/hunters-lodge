# frozen_string_literal: true

require 'aws-sdk-s3'
require 'base64'

module HuntersLodge
  class S3Client
    def initialize
      # role_arn = ENV.fetch('AWS_ROLE_ARN', nil)
      # if role_arn.nil?
      #   credentials = Aws::AssumeRoleCredentials.new(
      #     client: Aws::STS::Client.new,
      #     role_arn: role_arn,
      #     role_session_name: 'session-name'
      #   )
      #   @s3 = Aws::S3::Resource.new(
      #     region: 'us-west-2',
      #     credentials: credentials
      #   )
      # else
      @s3 = Aws::S3::Resource.new(region: 'us-west-2')
      # end
      @bucket ||= s3.bucket('hunters-lodge-develop')
    end

    attr_reader :bucket, :s3

    def upload(file_path, file_content)
      bucket.object(file_path).upload_file(file_content)
    rescue Aws::S3::Errors::ServiceError => e
      e.message
    end

    def download(file_path)
      puts file_path
      obj = bucket.object(file_path)
      file_ext = File.extname(file_path)
      tmp_file = Tempfile.new([File.basename(file_path, file_ext), file_ext])
      obj.get(response_target: tmp_file.path)
      Base64.encode64(tmp_file.read)
    rescue Aws::S3::Errors::ServiceError => e
      e.message
    ensure
      tmp_file.delete
    end
  end
end
