# frozen_string_literal: true

def list_objects # rubocop:disable Metrics/MethodLength
  puts '===== ===== ===== ===== ====='
  puts '===== Listing Objects ====='
  puts '===== ===== ===== ===== ====='

  s3 = Aws::S3::Client.new
  resp = s3.list_objects(bucket: $s3_bucket_name)
  resp.contents.each do |object|
    key = object.key
    size = object.size
    content = s3.get_object(bucket: $s3_bucket_name, key: key).body.read
    puts "Object '#{key}' is #{size} bytes with content: '#{content}'"
  end
end
