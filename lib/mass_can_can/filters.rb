module MassCanCan
  module Filters
    extend ActiveSupport::Concern

    included do
    #around_filter :set_authorizer
    before_filter :initialize_mass_can_can
    end

    def initialize_mass_can_can
    #MassCanCan::Ability.initialize_module
    current_ability
    end

    #  #def set_authorizer
    #  #  Thread.current[:_current_authorizer] = MassCanCan::Authorizer.new(current_ability)
    #  #  auth, ActiveRecord::Base.active_authorizer = ActiveRecord::Base.active_authorizer, Thread.current[:_current_authorizer]
    #  #  yield
    #  #ensure
    #  #  ActiveRecord::Base.active_authorizer = auth
    #  #end
  end
end
