class StaticController < ApplicationController
    def home
        #add a feature here to abstract special greeting based on day to a helper method.
        @greeting = "Welcome to the Home Page!"
    end
end
