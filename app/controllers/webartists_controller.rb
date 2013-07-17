class WebartistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  def index
    @webartists = Webartist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @webartists }
    end
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @webartist = params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @webartist }
    end
  end

  # GET /artists/new
  # GET /artists/new.json
  def new
    @webartist = Webartist.new
    @action = "Add"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @webartist }
    end
  end

  # GET /artists/1/edit
  def edit
    @webartist = Webartist.find(params[:id])
    @action = "Update"
  end

  # POST /artists
  # POST /artists.json
  def create
    @webartist = Webartist.new(params[:artist])

    respond_to do |format|
      if @webartist.save
        format.html { redirect_to @webartist, notice: "Artist was successfully created." }
        format.json { render json: @webartist, status: :created, location: @webartist }
      else
        format.html { render action: "new" }
        format.json { render json: @webartist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artists/1
  # PUT /artists/1.json
  def update
    @webartist = Webartist.find(params[:id])

    respond_to do |format|
      if @webartist.update_attributes(params[:artist])
        format.html { redirect_to @webartist, notice: "Artist was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @webartist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @webartist = Webartist.find(params[:id])
    name = @webartist.name
    @webartist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url, notice: "Artist '#{name}' was successfully deleted." }
      format.json { head :no_content }
    end
  end
end
