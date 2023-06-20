class Person < ApplicationRecord
  validates :name, :age, presence: true
  #validates_with MyValidator
  
  before_create :message 
  
  def message
    puts "you will create a model"
  end
  
end

