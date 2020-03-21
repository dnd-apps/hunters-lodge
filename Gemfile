# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :development do
  gem 'rack'
  gem 'rack-cors', require: 'rack/cors'
  gem 'rerun'
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
end

gem 'aws-sdk-s3'
gem 'grape'
gem 'graphql'
gem 'mini_magick'
gem 'serverless-rack'
