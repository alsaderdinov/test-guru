# frozen_string_literal: true
class User::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hello, #{current_user.name}!"
  end
end
