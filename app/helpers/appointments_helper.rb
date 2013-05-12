module AppointmentsHelper

def available_users
  options_for_select(User.all.map {|user| [user.person, user.id]})  
end

def render_appointments_list(appointments)
  if appointments.length > 0
    render 'appointments_list'
  else
    '<p>No appointments</p>'.html_safe
  end
end

end
