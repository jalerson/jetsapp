require 'dynamoid'

Dynamoid.configure do |config|
  config.namespace = 'webhooks'
  config.access_key = ENV['ACCESS_KEY_ID']
  config.secret_key = ENV['SECRET_ACCESS_KEY']
  config.region = ENV['REGION']
end

Dynamoid.included_models.each { |m| m.create_table(sync: true) }