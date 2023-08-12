# frozen_string_literal: true

def list_objects
  puts '===== ===== ===== ===== ====='
  puts '===== Listing Objects ====='
  puts '===== ===== ===== ===== ====='

  s3 = Aws::S3::Client.new
  resp = s3.list_objects(bucket: $s3_bucket_name)
  resp.contents.each do |object|
    key = object.key
    puts "- #{key}"
  end
end
