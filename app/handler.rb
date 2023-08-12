# frozen_string_literal: true

require 'aws-sdk-s3'
require 'dotenv'

require_relative './check_existence'
require_relative './list_objects'
require_relative './put_object'
require_relative './get_object'
require_relative './delete_object'

$s3_bucket_name = nil

def init
  Dotenv.load
  $s3_bucket_name = ENV['S3_BUCKET_NAME']
end

def handler
  init

  check_existence
  list_objects
  put_object
  get_object
  delete_object
end
