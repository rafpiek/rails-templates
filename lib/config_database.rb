def config_database

  # Change default primary key type to UUID
  initializer 'generators.rb', <<-RUBY
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
  RUBY

  # Change database.yml for PostgreSQL

  generate 'migration enable_uuid_extension', '--no-timestamps'
  rake("db:create")
  rake("db:migrate")
end
