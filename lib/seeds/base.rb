module Seeds
  class Base
    def self.call(*attributes)
      obj = self.new(*attributes)
      obj.call
    end

    def call
      raise NotImplementedError, "Subclasses must implement a 'call' method"
    end

    def seeds
      raise NotImplementedError, "Subclasses must implement a 'seeds' method"
    end
  end
end
