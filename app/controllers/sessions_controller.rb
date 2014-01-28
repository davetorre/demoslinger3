class SessionsController < ApplicationController
  
  def redirect
    # create client object with app credentials
    client = Soundcloud.new(:client_id => '',
                            :client_secret => '',
                            :redirect_uri => 'https://demoslinger.herokuapp.com/sessions/callback')

    # redirect user to authorize URL
    redirect_to client.authorize_url()
  end
  
  def callback
    # create client object with app credentials
    client = Soundcloud.new(:client_id => '',
                            :client_secret => '',
                            :redirect_uri => 'https://demoslinger.herokuapp.com/sessions/callback')
  
    # exchange authorization code for access object
    auth_code = params[:code]
    access_object = client.exchange_token(code: auth_code)
    
    # extract access token from access object
    access_token = access_object.access_token
    client = Soundcloud.new(access_token: access_token)
    
    # get info about soundcloud user
    current_user = client.get('/me')
    sc_user_name = current_user.username
    sc_user_id = current_user.id.to_s
        
    # check if user already exists in db. if not, create new
    user = User.find_by(sc_user_id: sc_user_id)
    if user.nil?
      user = User.new(sc_user_name: sc_user_name, sc_user_id: sc_user_id)
      if !user.save #unsuccessful save
        redirect_to root_path
      end
    else
      # keep the user's SC username up to date
      user.update_attributes(sc_user_name: sc_user_name)
    end
    sign_in user
    redirect_to root_path
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
