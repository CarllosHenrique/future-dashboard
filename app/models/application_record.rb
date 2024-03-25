# Description: This is the base class for all models in the application.
class ApplicationRecord < ActiveRecord::Base
  acts_as_hashids
  primary_abstract_class
end
