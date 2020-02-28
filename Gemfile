# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
#

group :development do
  gem 'rack'
  gem 'rerun'
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
  gem 'rack-cors', :require => 'rack/cors'

  gem 'puma'
end

gem 'mini_magick'
gem 'grape'
gem 'serverless-rack'
