
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]
MERCHANT_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/merchant.yml")
