module AppointmentsHelper

def available_users
  options_for_select(User.all.map {|user| [user.person, user.id]})  
end

end
