source "https://rubygems.org"

gem "rails", "~> 8.1.3"
gem "puma", ">= 5.0"
gem "pg", "~> 1.5"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false
gem "dotenv-rails", "~> 3.1"
gem "aws-sdk-s3", "~> 1"
gem "redis", "~> 5.0"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
