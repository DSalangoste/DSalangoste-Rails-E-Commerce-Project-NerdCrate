class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  # Only include safe attributes that should be searchable
  def self.ransackable_attributes(auth_object = nil)
    # Include all attributes that Ransack needs
    %w[
      created_at
      email
      encrypted_password
      id
      id_value
      remember_created_at
      reset_password_sent_at
      reset_password_token
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    []  # Add any associations here if needed
  end
end 