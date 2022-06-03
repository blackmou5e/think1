# frozen_string_literal: true

# frozen_strings_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :instances

    protected

    attr_writer :instances
  end

  module InstanceMethods
    protected

    def register_instance
      self.instances = (instances.nil? ? 1 : instances + 1)
    end
  end
end
