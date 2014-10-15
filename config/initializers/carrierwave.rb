
CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else

    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAIG4WU7DZHI3RBJTQ',                        # required
      :aws_secret_access_key  => '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'
    }
    config.fog_directory  = 'cmm-dev-mentorme'
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
    config.root = Rails.root.join('tmp')
    config.cache_dir = "uploads"
  end
end