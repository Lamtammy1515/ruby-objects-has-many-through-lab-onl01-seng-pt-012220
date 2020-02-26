

class Patient 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def appointments
    Appointment.all.select do |appointments| 
      appointments.patient == self 
    end 
  end 
  
  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end 
  
  def doctors 
    self.appointments.map do |appointments|
      appointments.doctor 
    end 
  end 
end 