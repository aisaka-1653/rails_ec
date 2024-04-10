# frozen_string_literal: true

module BasicAuthenticatable
  extend ActiveSupport::Concern

  included do
    before_action :basic_auth
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
