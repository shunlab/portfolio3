# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
end

private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:denger] = 'ログインしてください'
      redirect_to login_url
    end
  end
