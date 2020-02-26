

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
    Appointment.new(doctor, date, self)
  end 
  
  def doctors 
    Appointment.all.select do |appointments|
      appointments.doctor 
    end 
  end 
end 