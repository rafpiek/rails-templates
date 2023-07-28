def setup_testing_tools
  run "rails generate rspec:install"
  # Add FactoryBot syntax methods in RSpec configuration
  insert_into_file 'spec/rails_helper.rb', after: "RSpec.configure do |config|\n" do
    <<-RUBY
  config.include FactoryBot::Syntax::Methods
    RUBY
  end

  # Configure DatabaseCleaner in RSpec configuration
  insert_into_file 'spec/rails_helper.rb', before: "RSpec.configure do |config|\n" do
    <<-RUBY
  require 'database_cleaner'

  RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.around(:each) do |example|
      DatabaseCleaner.cleaning do
        example.run
      end
    end
    RUBY
  end

  # Configure Shoulda Matchers
  append_to_file 'spec/rails_helper.rb', <<-RUBY
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
  RUBY


end
