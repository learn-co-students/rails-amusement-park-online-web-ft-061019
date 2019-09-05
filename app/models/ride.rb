class Ride < ApplicationRecord
   belongs_to :attraction
   belongs_to :user

   def take_ride
      user = User.find_by_id(self.user_id)
      attraction = Attraction.find_by_id(self.attraction_id)
      
      not_enough_tickets = user.tickets < attraction.tickets
      not_enough_tallness = user.height < attraction.min_height

      errors_found = []
      if not_enough_tickets
         errors_found << "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      end
      if not_enough_tallness
         errors_found << "Sorry. You are not tall enough to ride the #{attraction.name}."
      end
      if not_enough_tallness && not_enough_tickets
         errors_found.clear
         errors_found << "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      end

      if errors_found.empty?
         user.tickets -= attraction.tickets
         user.nausea += attraction.nausea_rating
         user.happiness += attraction.happiness_rating
         user.save
      else
         errors_found.join(" ")
      end
   end

end
