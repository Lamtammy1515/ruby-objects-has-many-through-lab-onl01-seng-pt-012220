require 'pry'
class Doctor 
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
    Appointment.all.select {|apt| apt.doctor = self} 
  end  
  
  def new_appointment(patient, date)
    Appointment.new(patient, date, self)
  end 
  
  def patients 
    self.appointments.collect do |apt|
      apt.patient 
    end 
  end
  
end 