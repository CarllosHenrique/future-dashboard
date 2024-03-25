class ApplicationRecord < ActiveRecord::Base
  acts_as_hashids
  primary_abstract_class
end
