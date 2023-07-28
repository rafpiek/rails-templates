def setup_generators
  # Remove test generators for scaffold, tests, and helpers
  application do
    %q{
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false,
        scaffold_controller: false
      g.helper = false
      g.stylesheets = false
    end
  }
  end
end
