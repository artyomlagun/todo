class User < ActiveRecord::Base
  validates :fname, :lname, :email, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :email, uniqueness: true

  def fullname
    "#{lname} #{fname}"
  end
end
