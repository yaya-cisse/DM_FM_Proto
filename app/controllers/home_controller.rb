class HomeController < ApplicationController
  def index
    @versions = Version.all
  end
end
