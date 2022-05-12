class GossipsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :update, :edit, :destroy]
  
    def index 
        @gossips = Gossip.all
    end
  
    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        @gossip = Gossip.create
    end

    def create
        @gossip = Gossip.new('title' => params[:title], 'content' => params[:content]) 
        @gossip.user = current_user 
        if @gossip.save
            flash[:success] = "Ton nouveau potin a bien été créé !"
            redirect_to gossips_path
          else
            flash[:error] = "Oupsy doit y avoir une erreur, retente !"
            render 'new'
          end
          #mettre alerte erreur voir doc !
    end
    def edit
        @gossip = Gossip.find(params[:id])
    end

    def update
        @gossip = Gossip.find(params[:id])
        post_params = params.require(:gossip).permit(:title, :content)
        @gossip.update(post_params)
        redirect_to gossips_path
    end
    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to gossips_path
    end

    private
  
    def authenticate_user
        unless current_user
            flash[:danger] = "Veuillez-vous connecter pour accéder au contenu."
            redirect_to new_session_path
        end
    end
end