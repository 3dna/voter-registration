module VoterRegistration
  class RegisterController < VoterRegistration::ApplicationController
    def index
      unless params[:state].blank?
        redirect_to vote.register_new_path(params[:state])
      end

    end

    def new

      session[:register] = nil
      @guidelines = Guidelines.find_by_state(params[:state])
      @state = params[:state]


      if @guidelines.nil?
        redirect_to register_index_path, :alert => "Invalid State"
      else
        @instructions = Instructions.where(:state => @state)
        if session[:user].nil?
          @register = Register.new
        else
          auth = session[:user]
          name = auth.info.name.split
          @register = Register.new(:first_name => name[0], :last_name => name[1], :home_city => auth.info.location)
        end
      end
    end

    def create
      birth_date = Date.strptime("#{params[:register]['date_of_birth(2i)']}/#{params[:register]['date_of_birth(3i)']}/#{params[:register]['date_of_birth(1i)']}", '%m/%d/%Y')
      #Assembling the multi parameter because active_attr doesn't support this yet
      #see - https://github.com/cgriego/active_attr/issues/9

      @register = Register.new(params[:register].merge(:date_of_birth => birth_date))
      @state = params[:state]

      if @register.valid?
        session[:register] = @register
        redirect_to register_complete_path(@register.home_state), :notice => "Registration Complete"
      else
        @guidelines = Guidelines.find_by_state(@state)
        @instructions = Instructions.where(:state => @state)
        render :action => 'new'
      end
    end

    def complete

      if session[:register].blank?
        redirect_to root_path
      else
        @register = session[:register]
        @state_info = Guidelines.find_by_state(@register.home_state)

        respond_to do |format|
          format.html
          format.pdf do
            pdf = RegistrationPdf.new(@register, @state_info, view_context)
            send_data pdf.render, filename: "voter_registration.pdf",
              type: "application/pdf",
              disposition: "attachment"
          end
        end
      end
    end
  end
end