require 'spec_helper'

describe RegisterController do

  before(:each) do
    @guidelines = FactoryGirl.create(:guidelines)
  end


  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "should redirect to registration form for the state" do
      get :index, :state => "CA"
      response.should redirect_to vote.register_new_path("CA")
    end
  end

  describe "GET 'new'" do
    it "returns http success for a state parameter" do
      get :new, :state => "CA"
      response.should be_success
    end

    it "should redirect when an invalid state is passed" do
      get :new, :state => "HA"
      response.should redirect_to register_index_path
      flash[:alert].should == "Invalid State"
    end

    it "should handle an OmniAuth Callback" do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:default]
      session[:user] =  request.env["omniauth.auth"]
      get :new, :state => "CA"
      @register = session[:user]
      @register.info.name.should == "First Last"
      response.should be_success
    end

  end

  describe "POST 'create'" do
    before do
      @registration = {:title => "Mr",
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :home_address => Faker::Address.street_address,
        :home_city => Faker::Address.city,
        :home_state => "CA",
        :home_zip_code => Faker::Address.zip_code,
        'date_of_birth(2i)' => "01",
        'date_of_birth(3i)' => "02",
        'date_of_birth(1i)' => "1997",
        :id_number => "12345"}

    end
    describe "with valid parameters" do
      it "should create a new registration" do
        post :create, :state=> "CA", :register => @registration
        response.should redirect_to register_complete_path("CA")
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        Register.any_instance.stub(:save).and_return(false)
        post :create, :state => "CA", :register => {'date_of_birth(2i)' => "01",'date_of_birth(3i)' => "02",'date_of_birth(1i)' => "1997"}
        response.should render_template("new")
      end
    end
  end

  describe "GET complete" do
    before do
      @registration = Register.new({:title => "Mr",
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :middle_name => Faker::Name.first_name,
        :name_suffix => "",
        :home_address => Faker::Address.street_address,
        :home_city => Faker::Address.city,
        :home_apt => "",
        :home_state => "CA",
        :home_zip_code => "",
        :mailing_address => "",
        :mailing_city => "",
        :mailing_apt => "",
        :mailing_state => "",
        :mailing_zip_code => "",
        :previous_title => "",
        :previous_first_name => "",
        :previous_last_name => "",
        :previous_middle_name => "",
        :previous_suffix => "",
        :previous_address => "",
        :previous_apt => "",
        :previous_city => "",
        :previous_zip_code => "",
        :phone => "",
        :political_party => "",
        :ethnicity => "",
        :date_of_birth => Date.new(01/02/1977),
        :id_number => "12345"})
      @guidelines = FactoryGirl.create(:guidelines)
      session[:register]= @registration
    end

    it "should render the complete page" do
      get :complete, :state => "CA"
      response.should be_success
    end

    it "should redirect on an empty session" do
      session[:register] = nil
      get :complete, :state => "CA"
      response.should redirect_to root_path
    end

    it "should render the pdf" do
      get :complete, :state => "CA", :format=> "pdf"
      response.should be_success
    end
  end

end
