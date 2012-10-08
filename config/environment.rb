# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TripodMetricsV1::Application.initialize!
config.action_mailer.raise_delivery_errors = true
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
    address: "smtpout.secureserver.net",
    port: 25,
    domain: "tripod.net.co",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: "relacionescomerciales@tripod.net.co",
    password:"relacionescomerciales"
}

