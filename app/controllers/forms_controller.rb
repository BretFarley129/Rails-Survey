class FormsController < ApplicationController
    def index
    end

    def submit
        session[:user] = params[:user]
        redirect_to "/success"
    end

    def success
        session[:count] ||= 0
        session[:count] += 1
        @user = session[:user]
        flash[:success] = "Thanks for submitting this form! You have submitted this form #{session[:count]} times now"
    end

    private
        def form_params
            params.require(:user).permit(:name, :location, :language, :comments)
        end
end
