module VoterRegistration
  class HomeController < VoterRegistration::ApplicationController
    def index
      if params[:state]
        redirect_to vote.register_new_path(params[:state])
      end
    end
  end
end