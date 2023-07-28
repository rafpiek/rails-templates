def setup_frontend_tools
  # Create an initializer to enable ViewComponent
  initializer 'view_component.rb', <<-RUBY
Rails.application.config.view_component.show_previews = true
  RUBY

  create_file 'app/components/application_component.rb', <<-RUBY
class ApplicationComponent < ViewComponent::Base
  include ActionView::Helpers::UrlHelper
  include ActionView::RecordIdentifier
  include Turbo::Streams::Broadcasts
  include Turbo::Streams::StreamName
  include Turbo::FramesHelper
end
  RUBY

  run "yarn add daisyui @tailwindcss/typography local-time @rails/request.js"
  run "yarn add @fortawesome/fontawesome-free"

  # Replace content of tailwind.config.js file with force
  create_file 'tailwind.config.js', <<-JS, force: true
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/components/**/*.html.erb',
    './app/components/**/*.rb',
  ],
  plugins: [
    require("@tailwindcss/typography"),
    require('daisyui'),
  ],
  theme: {
    extend: {},
  },
  variants: {},
  purge: false,
  daisyui: {
    themes: ['light', 'dark'],
  }
}
  JS


  append_to_file 'app/javascript/application.js', <<-JS
import "@fortawesome/fontawesome-free/js/all";
  JS

  # And in your application stylesheet:
  append_to_file 'app/javascript/application.js', <<-JS
import '@fortawesome/fontawesome-free/css/all.css';
  JS

  gsub_file 'app/views/layouts/application.html.erb', /<\/head>/, '<%= javascript_include_tag "turbo", type: "module" %></head>'
  rake('livereload:install')
  generate "heroicon:install"
  # Append class to body tag in application.html.erb
  gsub_file 'app/views/layouts/application.html.erb', /<body>/, '<body class="h-full prose">'
  # Append data-theme to html tag in application.html.erb
  gsub_file 'app/views/layouts/application.html.erb', /<html(.*?)>/, '<html\1 data-theme="light" class="h-full">'

end
