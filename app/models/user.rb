class User < ApplicationRecord
   has_many :rides
   has_many :attractions, through: :rides

   validates :password, presence: true

   def mood
      self.happiness < self.nausea ? "sad" : "happy" unless self.happiness.nil? && self.nausea.nil?
   end

end
