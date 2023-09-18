require_relative '../lib/add_helpers'
require_relative '../lib/config_database'
require_relative '../lib/source_paths'
require_relative '../lib/add_gems'
require_relative '../lib/add_root_path'
require_relative '../lib/set_application_name'
require_relative '../lib/devise'
require_relative '../lib/setup_testing_tools'
require_relative '../lib/add_sidekiq'
require_relative '../lib/add_ui_helpers'
require_relative '../lib/init_git_repo'
require_relative '../lib/setup_frontend_tools'
require_relative '../lib/setup_rubocop'
require_relative '../lib/setup_generators'
require_relative '../lib/seed_db'
require_relative '../lib/copy_views'

def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

add_gems(api: true)
run 'bundle install'

after_bundle do
  setup_generators
  add_api_root_path
  config_database
  set_application_name
  # setup_devise
  add_sidekiq
  setup_testing_tools
  add_api_helpers

  rails_command 'db:migrate'
  seed_db
  setup_rubocop
  init_git_repo
end
