def seed_db
  copy_file '../lib/files/db/seeds.rb', 'db/seeds.rb', force: true
  rails_command "db:seed"
end
