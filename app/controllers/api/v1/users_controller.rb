

module Api
  module V1
    class UsersController &amp;lt; ApplicationController
      http_basic_authenticate_with name: &amp;quot;admin&amp;quot;, password: &amp;quot;secret&amp;quot;
      respond_to :json

      # Actions omitten
    end
  end
end

