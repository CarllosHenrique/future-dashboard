class ApplicationController < ActionController::Base # rubocop:disable Style/Documentation
  before_action :authenticate_user!
end
