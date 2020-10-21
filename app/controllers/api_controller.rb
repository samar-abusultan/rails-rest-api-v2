# acting as parent class for apis controllers to set the default format to json
class ApiController < ApplicationController
  include Knock::Authenticable

  before_action :authenticate_user
  before_action :set_default_format

  private
   def set_default_format
    request.format = :json
   end
  #  def authenticate_user
  #   authenticate_for V1::User
  #  end
end
