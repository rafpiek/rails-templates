def setup_api_authentication
  run 'rails g authentication --api --passwordless --trackable --invitable --masqueradable --tenantable --force'

  # generate migration to add timeout to session
  generate 'migration add_timeout_to_sessions timeout:datetime:index'
  rake("db:migrate")


  gsub_file Dir['config/routes.rb'].first, /Rails.application.routes.draw do/, <<~RUBY
  Rails.application.routes.draw do
    scope '/', defaults: { format: :json } do
      end
RUBY
end
