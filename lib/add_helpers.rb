def helpers
  <<-RUBY
before_action :authenticate_user!
private

def turbo(action, turbo_tag)
  turbo_stream.send(action, turbo_tag)
end

def render_turbo(*args)
  respond_to do |format|
    format.turbo_stream do
      render turbo_stream: args.compact
    end
  end
end

def replace_turbo_component(dom_id, component)
  respond_to do |format|
    format.turbo_stream do
      stream = turbo_stream.replace dom_id do
        view_context.render(component)
      end
      render turbo_stream: stream
    end
  end
end

def in_transaction(model: nil)
  if model
    model.transaction do
      yield if block_given?
    end
  else
    ActiveRecord::Base.transaction do
      yield if block_given?
    end
  end
end

def development?
  Rails.env.eql? 'development'
end

def production?
  Rails.env.eql? 'production'
end

def command_bus
  Rails.configuration.command_bus
end

def event_store
  Rails.configuration.event_store
end

def cqrs
  Rails.configuration.cqrs
end

def uuid!
  SecureRandom.uuid
end
  RUBY
end

def add_helpers
  insert_into_file 'app/controllers/application_controller.rb', after: 'class ApplicationController < ActionController::Base' do
    "\n#{helpers}\n"
  end
end
