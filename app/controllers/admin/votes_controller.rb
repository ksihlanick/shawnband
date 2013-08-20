class Admin::VotesController < ApplicationController
  before_filter :authenticate

  def index
    @votes = Vote.all
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_USER'] && password == ENV['HTTP_PASS']
    end
  end

end
