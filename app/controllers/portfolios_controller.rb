class PortfoliosController < ApplicationController
    # access is allowing access to specific petergate defined roles from the petergate gem
    access all: [:show, :index], user: {except: [:destroy]}, admin: :all

    def index
        @portfolios = Portfolio.all
    end

    def show
    end

    def new
        @portfolio = Portfolio.new
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
        if @portfolio.save
            # logic to redirect ot nwe portfolio's show page
        else
            render :new
        end
    end
end
