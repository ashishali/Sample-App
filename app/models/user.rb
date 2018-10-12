class User < ActiveRecord::Base
  validate :password_rule
  validates :password, length: {maximum: 12, minimum: 6}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
  def password_rule
	  message = "must include on lowercase, one uppercase, a number and a special char"
	  if not password.match(/[a-z]/).present?
            errors.add(:base, message)
	  elsif not password.match(/[A-Z]/).present?
		  errors.add(:base, message)
	  elsif not password.match(/[0-9]/).present?	
		  errors.add(:base, message)
          elsif not password.match(/[!-+]|(@|^)/).present?		  
		  errors.add(:base, message)
	  end		  
          		  
  end
end
