class ApplicationRecord < ActiveRecord::Base
  require "sprockets/railtie"


  self.abstract_class = true
end
