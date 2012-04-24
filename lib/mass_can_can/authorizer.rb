require 'singleton'

module MassCanCan

  class Authorizer
    include Singleton
    attr_reader :whitelist

    def initialize
      reset
    end

    def reset
      @whitelist = {}
    end
  end
end
