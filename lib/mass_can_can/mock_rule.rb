module MassCanCan
  class MockRule
    attr_reader :attributes, :actions, :subjects

    def initialize(base_behavior, action = nil, subject = nil, *extra_args, &block)
      @actions = [action].flatten
      @subjects = [subject].flatten
      @attributes = [extra_args.shift].flatten if extra_args.first.kind_of?(Symbol) || extra_args.first.kind_of?(Array) && extra_args.first.first.kind_of?(Symbol)
    end
  end
end
