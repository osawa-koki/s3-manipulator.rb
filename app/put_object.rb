# frozen_string_literal: true

# This class builds a message from a random prefix and flower name.
class MessageBuilder
  # rubocop:disable Style/ClassVars
  @@prefixes = %w[
    cool
    awesome
    amazing
    great
    fantastic
    wonderful
    stupendous
    incredible
    marvelous
    spectacular
    extraordinary
  ].freeze
  @@flowers = %w[
    rose
    daisy
    tulip
    lily
    sunflower
    daffodil
    orchid
    peony
    marigold
    dahlia
    chrysanthemum
    hydrangea
  ].freeze
  # rubocop:enable Style/ClassVars

  def self.build
    "#{@@prefixes.sample} #{@@flowers.sample}"
  end
end

def put_object
  puts '===== ===== ===== ===== ====='
  puts '===== Putting Objects ====='
  puts '===== ===== ===== ===== ====='

  s3 = Aws::S3::Client.new
  key = Time.now.strftime('%Y_%m_%d_%H_%M_%S')
  s3.put_object(bucket: $s3_bucket_name, key: "#{key}.txt", body: {
    'message' => MessageBuilder.build,
    'timestamp' => Time.now.to_s
  }.to_json)
end
