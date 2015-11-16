require 'carrierwave/orm/activerecord'
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.storage = :file

  if Rails.env.test? || Rails.env.cucumber?
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
    end
  end
end