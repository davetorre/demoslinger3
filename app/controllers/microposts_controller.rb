class MicropostsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy

  def new
    @micropost = current_user.microposts.build if signed_in?
  end
  
  def create
    client = Soundcloud.new(:client_id => 'ea6c8c0f29057082543a82182b0d4e15')

    # get a tracks oembed data
    thing = client.get('/oembed', :url => params[:micropost][:link])[:html]
    params[:micropost][:link] = thing
    
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to root_url
    else
      @feed_items = []
      render 'microposts/new'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end
  
  private
  
    def micropost_params
      params.require(:micropost).permit(:content, :link, :drums, :vocals, :bass,
                                 :guitar, :keyboards, :production, :songwriting)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end