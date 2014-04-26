# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
ThirstyHipster::Application.initialize!

Time::DATE_FORMATS[:quick] = "%l:%M %p"
