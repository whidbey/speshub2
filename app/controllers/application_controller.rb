class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def self.rescue_errors
    rescue_from Exception, :with => :render_error
    rescue_from RuntimeError, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionController::UnknownAction, :with => :render_not_found
  end

  #rescue_errors unless Rails.env.development?

  def render_not_found(exception = nil)
    render :file => "/public/404.html", :status => 404
  end

  def render_error(exception = nil)
    render :file => "/public/500.html", :status => 500
  end


end
