Rails.application.routes.draw do

  mount VoterRegistration::Engine => "/voter_registration"
end
