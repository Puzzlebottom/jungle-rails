module RestrictAccess
  extend ActiveSupport::Concern

  included do
    http_basic_authenticate_with name: ENV['ADMIN_AUTH_USERNAME'], password: ENV['ADMIN_AUTH_PASSWORD']
  end
end
