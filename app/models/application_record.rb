class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  enum gender: { M: "M", F: "F" }
end
