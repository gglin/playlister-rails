class WebsongsController < ApplicationController

  def show
  	@websong = params[:id]
  	@webartist = request.fullpath.split('/')[2].gsub(/%20/i, " ")
    @video_id = Websong.youtube(@webartist, @websong)
  end

end