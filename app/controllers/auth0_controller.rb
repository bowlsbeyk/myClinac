class Auth0Controller < ApplicationController
    def callback
      # OmniAuth stores the informatin returned from Auth0 and the IdP in request.env['omniauth.auth'].
      # In this code, you will pull the raw_info supplied from the id_token and assign it to the session.
      # Refer to https://github.com/auth0/omniauth-auth0#authentication-hash for complete information on 'omniauth.auth' contents.
      auth_info = request.env['omniauth.auth']
      session[:userinfo] = auth_info['extra']['raw_info']
      #Sub is the user ID

      #search for the user
      user = User.find_by_authID(session[:userinfo]['sub'])
      #if user is not found or has incomplete information then force them to fill out the new information page
      if !user.present? or !user.is_complete?
        redirect_to controller: 'user', action: 'new_information_page', user: user
      else
        redirect_to controller: 'static_pages', action: 'user_dashboard', user: user
      end

    end

    def failure
      # Handles failed authentication -- Show a failure page (you can also handle with a redirect)
      @error_msg = request.params['message']
    end

    def logout

    end
  end