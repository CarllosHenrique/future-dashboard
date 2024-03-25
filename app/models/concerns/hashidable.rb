# Description: Módulo que adiciona a funcionalidade de hashids a um model.
module Hashidable
  extend ActiveSupport::Concern

  included do
    class << self
      def inherited(subclass)
        super
        # Define acts_as_hashids com um secret único para cada subclass
        subclass.class_eval do
          secret = subclass.name + Rails.application.secret_key_base
          alphabet = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
          length = 12
          acts_as_hashids(alphabet:, length:, secret:)
        end
      end
    end
  end
end
