class WebartistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  def index
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @webartist = params[:id]
    @webartiste = Webartist.new(@webartist)
  end

end
