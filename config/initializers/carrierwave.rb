require 'fog/aws/storage'
require 'carrierwave'

CarrierWave.configure do |config|
  config.enable_processing = true unless Rails.env.test?
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'] || 'xxx',
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] || 'xxx',
      region: 'eu-central-1',
    }
    config.fog_directory = ENV['AWS_BUCKET'] || 'codaisseur-staging'
  end
end
