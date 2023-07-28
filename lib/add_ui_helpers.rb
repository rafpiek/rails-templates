def add_ui_helpers
  inject_into_file 'config/initializers/inflections.rb' do <<-EOF
  ActiveSupport::Inflector.inflections(:en) do |inflect|
    inflect.acronym "UI"
  end
  EOF
  end
end
