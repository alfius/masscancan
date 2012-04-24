require 'mass_can_can/mock_rule'
require 'mass_can_can/authorizer'

module MassCanCan
  module Ability
    extend ActiveSupport::Concern

    include CanCan::Ability

    included do
      # load all the models
      Dir.glob(Rails.root + 'app/models/*.rb').each { |file| require file }

      # and define the default security
      ActiveRecord::Base.descendants.each do |c|
        c.class_eval do
          define_singleton_method(:active_authorizer) do
            wl = [""] | Authorizer.instance.whitelist[c.name.tableize.to_sym].to_a
            {:default => ActiveModel::MassAssignmentSecurity::WhiteList.new(wl)}
          end
        end
      end
    end

    def can(*args, &block)
      super
      rule = MockRule.new(true, *args, &block)
      if rule.attributes && rule.actions.include?(:update)
        rule.subjects.each do |subject|
          Authorizer.instance.whitelist[subject] ||= Set[]
          Authorizer.instance.whitelist[subject] |= rule.attributes.map(&:to_s).to_set
        end
      end
    end

    def cannot(*args, &block)
      super
      rule = MockRule.new(true, *args, &block)
      if rule.attributes && rule.actions.include?(:update)
        rule.subjects.each do |subject|
          Authorizer.instance.whitelist[subject] ||= Set[]
          Authorizer.instance.whitelist[subject].reject! {|a| rule.attributes.map(&:to_s).include? a}
        end
      end
    end
  end
end
