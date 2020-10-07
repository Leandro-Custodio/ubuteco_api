source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'
gem 'rails-i18n'
gem 'fog-aws'
gem 'carrierwave', '~> 2.0'
gem 'carrierwave-i18n'
gem 'carrierwave-base64'
gem 'mini_magick'
gem "paranoia", "~> 2.2"
gem 'money-rails', '~>1.13'
gem 'dry-configurable', '0.9.0'
gem 'devise'
gem 'devise-jwt', '~> 0.5.9'
gem 'devise-i18n'
gem "devise-encryptable"
gem 'devise-argon2'
gem 'config'
gem 'rack-attack'
gem "cpf_cnpj"
gem "validators"
gem 'redis-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'fuubar'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
