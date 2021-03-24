class PortfoliosController < ApplicationController
    # access is allowing access to specific petergate defined roles from the petergate gem
    before_action :find_portfolio, only: [:show, :update, :destroy]

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
            redirect_to user_portfolio_path(current_user, @portfolio)
        else
            flash[:error] = "Portfolio was not properly created. Try again."
            render :new
        end
    end

    def edit
    end

    def update
        
    end

    def destroy

    end

    private 

    def find_portfolio
        @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
        params.require(:portfolio).permit(:name, :header, :description, :category, :user_id)
    end
end
