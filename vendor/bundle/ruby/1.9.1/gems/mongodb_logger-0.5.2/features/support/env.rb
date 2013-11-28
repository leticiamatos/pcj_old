require 'active_support'
require 'rspec'
require 'aruba/cucumber'

PROJECT_ROOT     = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze
TEMP_DIR         = File.join(PROJECT_ROOT, 'tmp').freeze
LOCAL_RAILS_ROOT = File.join(TEMP_DIR, 'rails_root').freeze

Before do
  FileUtils.rm_rf(LOCAL_RAILS_ROOT)
end

When /^I reset Bundler environment variable$/ do
  BUNDLE_ENV_VARS.each do |key|
    ENV[key] = nil
  end
end

def prepend_path(path)
  ENV['PATH'] = path + ":" + ENV['PATH']
end