class UsersController < ApplicationController

    
    
    
    def show
    @user = User.find(params[:id])
    end

    def new
    @user = User.create
    end
    def create
        @user = User.new(
            'first_name' => params[:first_name],
            'last_name' => params[:last_name],
            'description' => params[:description],
            'age' => params[:age],
            'email' => params[:email],
            'password' => params[:password],
            'zipcode' => params[:zipcode],
            'city_id' => rand(City.all.first.id..City.all.last.id),
            )
            if @user.save
                flash[:success] = "Ton profil a bien été créé !"
            redirect_to @user
            else
                flash[:error] = "Un truc a foiré"
                render "new"
            end

    end

end

