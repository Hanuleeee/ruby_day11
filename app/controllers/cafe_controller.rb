class CafeController < ApplicationController
    
    def index
        @cafe = Cafe.all
    end
    
end
