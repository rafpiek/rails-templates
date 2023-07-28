def setup_devise
  generate "devise:install"
  generate "devise User"
  generate "devise Admin"
  generate "devise:views"
  inject_into_file "config/initializers/devise.rb", "  config.navigational_formats = ['/', :html, :turbo_stream]", after: "Devise.setup do |config|\n"
  gsub_file "config/initializers/devise.rb", /  # config.secret_key = .+/, "  config.secret_key = Rails.application.credentials.secret_key_base"
  environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000}",
              env: 'development'
  inject_into_file 'app/controllers/application_controller.rb', after: "ActionController::Base\n" do <<~EOF
    before_action :authenticate_user!
  EOF
  end

  # copy_file '../lib/views/devise/sessions/new.html.erb', 'app/views/devise/sessions/new.html.erb', force: true
  # copy_file '../lib/views/devise/registrations/new.html.erb', 'app/views/devise/registrations/new.html.erb', force: true
  # copy_file '../lib/views/devise/passwords/new.html.erb', 'app/views/devise/passwords/new.html.erb', force: true
  # copy_file '../lib/views/devise/passwords/edit.html.erb', 'app/views/devise/passwords/edit.html.erb', force: true
end
