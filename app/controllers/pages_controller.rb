class PagesController < ApplicationController

    def home

    end

    def team

    end

    def contact
    end
    def welcome
        @name = params[:name]
    end
end