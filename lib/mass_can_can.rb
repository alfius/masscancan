require 'mass_can_can/filters'

ActiveSupport.on_load(:action_controller) do
  ActionController::Base.send(:include, MassCanCan::Filters)
end

