class Project < ApplicationRecord
	validates :name, presence: true

	def self.search(search)
	  if search != ''
	    self.where(name: search)
      else
	    self.all
	  end
	end
end
