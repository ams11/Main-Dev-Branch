# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
V2::Application.initialize!

ExceptionNotifier.exception_recipients = %w(joelmcconaughy@gmail.com)
ExceptionNotifier.sender_address = %("Application Error" <app.error@soletron.com>)
ExceptionNotifier.email_prefix = "[APP]"
