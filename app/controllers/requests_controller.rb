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
    if @request.save
      flash[:success] = "Ok, request taken"

      # launch scan job
      @request.parse_request(@request.req_url, @request.id)
      # @request.parse(request_params.req_url , @request.id)
      redirect_to index
    else
      render index
    end
  end

  def show
    @offers = Request.find(params[:id]).offers
  end

  def destroy
  end

  private
  def request_params
    params.require(:request).permit(:name, :req_url)
  end
end
