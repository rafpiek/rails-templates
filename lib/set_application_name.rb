def set_application_name
  environment "config.application_name = Rails.application.class.module_parent_name"
end
