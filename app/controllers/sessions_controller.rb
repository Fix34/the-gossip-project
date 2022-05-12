class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            log_in(@user)
            flash[:success] = "Connexion réussie"
            redirect_to gossips_path
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render new_session_path
        end
    end

    def destroy
        session.delete(:user_id)
    redirect_to gossips_path
    end

end

