
APP_CONFIG = YAML.load_file("#{::Rails.root.to_s}/config/config.yml")[::Rails.env]
MERCHANT_CONFIG = YAML.load_file("#{::Rails.root.to_s}/config/merchant.yml")
