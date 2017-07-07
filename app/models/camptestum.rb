class Camptestum < ActiveRecord::Base
	has_many :camprighe
	belongs_to :user
end
