class WelcomeController < ApplicationController
  def index
    @stadiums = Stadium.all
  end
end
