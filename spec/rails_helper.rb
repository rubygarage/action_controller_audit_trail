ENV["RAILS_ENV"] ||= "test"
ENV["DB"] ||= "sqlite"

require "spec_helper"
require 'rspec/rails'
require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)

ActiveRecord::Migration.check_pending! if ActiveRecord::Migration.respond_to?(:check_pending!)
