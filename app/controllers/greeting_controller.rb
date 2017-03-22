class GreetingController < ApplicationController

  # GET /welcome
  def index
    form_tag=["name","sauce"]
    flash[:notice] = "Your IP is " + request.remote_ip
  end

end
