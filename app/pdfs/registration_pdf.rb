require 'prawn-fillform'

class RegistrationPdf < Prawn::Document
  def initialize(register, state_info, view)
    filename = "#{VoterRegistration::Engine.root}/public/nvra-en.pdf"
    super(:template => filename)

    font("Helvetica", :size=> 10)

    #Secretary of State
    text_box state_info.mail_to_address_1, :at => [80, cursor-550]
    text_box state_info.mail_to_address_2, :at => [80, cursor-580]
    text_box state_info.mail_to_address_3, :at => [80, cursor-610]
    text_box state_info.mail_to_address_4, :at => [80, cursor-640]

    go_to_page(2)
    #Age / Citizen
    text_box "X", :at => [175, cursor-22]
    text_box "X", :at => [175, cursor-35]

    #Name - Box1
    text_box register.title, :at => [5, cursor-80]
    text_box register.last_name, :at => [70, cursor-80]
    text_box register.first_name,  :at => [200, cursor-80]
    text_box register.middle_name, :at => [340, cursor-80]
    text_box register.name_suffix, :at => [480, cursor-80]

    #Home Address - Box2
    text_box register.home_address, :at => [1, cursor-110]
    text_box register.home_apt, :at => [225, cursor-110]
    text_box register.home_city, :at => [282, cursor-110]
    text_box register.home_state, :at => [400, cursor-110]
    text_box register.home_zip_code, :at => [468, cursor-110]

    #Mailing Address - Box3
    text_box "#{register.mailing_address} #{register.mailing_apt}", :at => [1, cursor-140]
    text_box register.mailing_city, :at => [282, cursor-140]
    text_box register.mailing_state, :at => [400, cursor-140] unless register.mailing_state.nil?
    text_box register.mailing_zip_code, :at => [468, cursor-140]

    #DOB,Race,Ethnicity,Political Party, ID - Boxes 4,5,6,7,8
    text_box register.date_of_birth.strftime("%m    %d      %Y"), :at => [63, cursor-165]
    text_box register.phone, :at => [160, cursor-175]
    text_box register.id_number, :at => [310, cursor-190]
    text_box register.political_party, :at => [1, cursor-210]
    text_box register.ethnicity, :at => [160, cursor-210]

    #Previous Name - Box A
    text_box register.previous_title, :at => [-4, cursor-430] unless register.previous_title.nil?
    text_box register.previous_last_name, :at => [17, cursor-430]
    text_box register.previous_first_name, :at => [200, cursor-430]
    text_box register.previous_middle_name, :at => [345, cursor-430]
    text_box register.previous_suffix, :at => [480, cursor-430]

    #Previous Address - Box B
    text_box register.previous_address, :at => [1,cursor-475]
    text_box register.previous_apt, :at => [220,cursor-475]
    text_box register.previous_city, :at => [290, cursor-475]
    text_box register.previous_state, :at => [400, cursor-475] unless register.previous_state.nil?
    text_box register.previous_zip_code, :at => [470, cursor-475]

    go_to_page(3)

    #Return Address
    text_box "#{register.title} #{register.first_name} #{register.last_name}", :at => [-20, cursor-390]
    text_box "#{register.home_address} #{register.home_apt}", :at => [-20, cursor-415]
    text_box "#{register.home_city}, #{register.home_state} #{register.home_zip_code}", :at => [-20, cursor-435]

    #Secretary of State
    text_box state_info.mail_to_address_1, :at => [80, cursor-580]
    text_box state_info.mail_to_address_2, :at => [80, cursor-610]
    text_box state_info.mail_to_address_3, :at => [80, cursor-640]
    text_box state_info.mail_to_address_4, :at => [80, cursor-670]

    #Prawn doesnt support filling in forms
    #prawn-fillform has a bug that doesnt display the offset correctly
    #https://github.com/moessimple/prawn-fillform/pull/2
    #So we are faking in the filled in form
    data = {}
    fill_form_with(data)
  end

end
