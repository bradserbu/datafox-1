class MainController < ApplicationController
  http_basic_authenticate_with name: "tanlin", password: "tanlin"

  def index

  end
  
end
