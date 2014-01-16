class StaticPagesController < ApplicationController
  def home
    @feed_items = Micropost.paginate(page: params[:page])
  end

  def help
  end

  def about
  end
  
  def drums
    @feed_items = Micropost.where("drums = ?", true).paginate(page: params[:page])
  end
  
  def bass
    @feed_items = Micropost.where("bass = ?", true).paginate(page: params[:page])
  end
  
  def keys
    @feed_items = Micropost.where("keyboards = ?", true).paginate(page: params[:page])
  end
  
  def guitars
    @feed_items = Micropost.where("guitar = ?", true).paginate(page: params[:page])
  end
  
  def vocals
    @feed_items = Micropost.where("vocals = ?", true).paginate(page: params[:page])
  end
end
