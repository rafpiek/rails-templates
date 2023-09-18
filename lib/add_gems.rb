def add_gems(api: false)
  gem 'devise'
  gem 'friendly_id'
  gem 'sidekiq'
  gem 'pagy'
  gem 'paper_trail'
  gem 'httparty'
  gem 'ransack'
  gem 'paranoia'
  gem 'aasm'
  gem 'simple_command'
  gem 'whenever', require: false
  gem 'pundit'

  unless api
    gem 'view_component', require: true
    gem 'heroicon'
  end

  gem_group :development do
    gem 'annotate'
    gem 'brakeman'
    gem 'bullet'
    gem 'rails_best_practices'
    gem 'reek'
    gem 'hotwire-livereload' unless api
  end

  gem_group :development, :test do
    gem 'faker'
    gem 'pry-rails'
    gem 'better_errors'
    gem 'rubocop'
    gem 'rubocop-performance'
    gem 'rubocop-rails'
    gem 'rubocop-rspec'
    gem 'spring-commands-rspec'
  end

  gem_group :test do
    gem 'rspec-rails'
    gem 'factory_bot_rails'
    gem 'simplecov'
    gem 'timecop'
    gem 'fivemat'
    gem 'shoulda-matchers'
    gem 'database_cleaner-active_record'
    gem 'rails-controller-testing'
  end
end
