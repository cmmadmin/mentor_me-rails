CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAILQJEICVHRF7VBZQ',                        # required
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'mentorme-dev-1'
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.root = Rails.root.join('tmp')
  config.cache_dir = "uploads"
end