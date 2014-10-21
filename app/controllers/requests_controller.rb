class RequestsController < ApplicationController

  def index
    @requests = Request.all
    @request = Request.new
  end

  def new
  end

  def create
    # @name = params[:name]
    # @url  = params[:url]
    @request = Request.new(request_params)
    if(@request.save)
      flash[:success] = "Ok, request taken"
      redirect_to index
    else
      render index
    end
  end

  def destroy
  end

  private
  def request_params
    params.require(:request).permit(:name, :url)
  end
end
