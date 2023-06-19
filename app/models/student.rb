class Student < ApplicationRecord
  has_many :blogs
  has_many :student_projects
  has_many :projects, through: :student_projects

  validates :first_name, :last_name, :contact_number, :email, presence: true
  validates :contact_number, :email, uniqueness: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }

  after_create :display_student_age
  after_commit :upcase_name, if: :name_is_Duc?

  def display_student_age
    if self.dob.present?
      age = Date.today.year - self.dob.year
        puts "===Age of student is #{age}==="
    else
    	puts "===Age cannot be calculated without date of birth==="
    end
  end

  def name_is_Duc?
    self.first_name == "Duc"
  end

  def upcase_name
    self.first_name.upcase
    self.last_name.upcase
    puts "name has been capitalized"
  end
end
