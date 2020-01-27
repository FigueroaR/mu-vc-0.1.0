class ApplicationRecord < ActiveRecord::Base
  
  #add_flash_types :info, :error, :warning
  
  self.abstract_class = true
end
