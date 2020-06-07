# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Load carrierwave in the Rails application.
require 'carrierwave/orm/activerecord'
