#module MassCanCan

  #ActiveSupport::Notifications.subscribe /process_action.action_controller/ do
  #  ActionController::Base.send(:current_ability)
  #end 


  #class Authorizer
  #  def initialize(ability)
  #    @ability = ability
  #  end

  #  def operator[](role)
  #    return WhiteList.new(ability) if role == :default
  #    WhiteList.new(ability)
  #  end
  #end

  #class WhiteList
  #  def initialize(ability)
  #    @ability = ability
  #  end

  #  def include?
  #    @ability.can? :update, :
  #  end
  #end

#end

require 'mass_can_can/filters'

ActiveSupport.on_load(:action_controller) do
  ActionController::Base.send(:include, MassCanCan::Filters)
end

