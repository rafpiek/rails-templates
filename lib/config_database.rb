def config_database

  # Change default primary key type to UUID
  initializer 'generators.rb', <<-RUBY
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
  RUBY

  # Change database.yml for PostgreSQL

  generate 'migration enable_uuid_extension', '--no-timestamps'

  # add to generated migration file : enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  gsub_file Dir['db/migrate/*_enable_uuid_extension.rb'].first, /def change\n/, "def change\n    enable_extension 'pgcrypto'\n"
  rake("db:create")
  rake("db:migrate")
end
