class Admin::VotesController < ApplicationController
  before_filter :authenticate

  def index
    @votes = Vote.all
  end

  def noskips
    @votes = Vote.where("favsong != ''")
  end

  def comments
    @votes = Vote.where("comment != ''")
  end

  def skips
    @votes = Vote.where("favsong = ''")
  end

  # def stats
  #   @votes = Vote.all
  #   @votes.each do |vote|
  #   end
  # end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_USER'] && password == ENV['HTTP_PASS']
    end
  end

end
