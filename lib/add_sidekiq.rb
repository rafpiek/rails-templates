def add_sidekiq
  environment 'config.active_job.queue_adapter = :sidekiq'
  insert_into_file "config/routes.rb",
                   "require 'sidekiq/web'\n\n",
                   before: "Rails.application.routes.draw do"
  insert_into_file "config/routes.rb",
                   "authenticate :admin do \n mount Sidekiq::Web => '/sidekiq'\n end \n\n",
                   after: "Rails.application.routes.draw do\n"
end
