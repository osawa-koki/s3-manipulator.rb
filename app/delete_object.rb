# frozen_string_literal: true

def delete_object # rubocop:disable Metrics/MethodLength
  puts '===== ===== ===== ===== ====='
  puts '===== Deleting Objects ====='
  puts '===== ===== ===== ===== ====='

  # 50%の確率で削除する。
  if rand(2).zero?
    puts 'No objects to delete.'
    return
  end

  s3 = Aws::S3::Client.new
  objects = s3.list_objects(bucket: $s3_bucket_name)
  object = objects.contents.sample

  key = object.key
  puts "Deleting object '#{key}'..."
  s3.delete_object(bucket: $s3_bucket_name, key: key)
end
