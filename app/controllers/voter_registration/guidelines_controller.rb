module VoterRegistration
  class GuidelinesController < VoterRegistration::ApplicationController
    def index
      @states = Guidelines.all
    end

    def show
      @guidelines = Guidelines.find_by_state(params[:id])

      if @guidelines.nil?
        redirect_to guidelines_path, :alert => "Invalid state"
      end

    end

  end
end