class HomeController < ApplicationController
#gon gem allows current_user to be used in JS fullCalendar file. 
    def index
        gon.current_user = current_user
    end
end
