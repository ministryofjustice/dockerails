class HomeController < ApplicationController
  def index
    @previous_access = Access.last

    Access.create!(code: SecureRandom.urlsafe_base64(20))
  end
end