module MassCanCan
  module Filters
    extend ActiveSupport::Concern

    included do
    before_filter :initialize_mass_can_can
    end

    def initialize_mass_can_can
    #MassCanCan::Ability.initialize_module
    current_ability
    end
  end
end
