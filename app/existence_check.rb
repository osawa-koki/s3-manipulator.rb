# frozen_string_literal: true

require 'aws-sdk-s3'

def existence_check
  puts '===== ===== ===== ===== ====='
  puts '===== Existence Check ====='
  puts '===== ===== ===== ===== ====='

  s3 = Aws::S3::Resource.new
  bucket = s3.bucket($s3_bucket_name)
  if bucket.exists?
    puts "Bucket '#{$s3_bucket_name}' exists."
  else
    puts "Bucket '#{$s3_bucket_name}' does not exist."
  end
end