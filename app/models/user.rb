class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :notes,
             :dependent => :destroy

  has_many   :ratings,
             :dependent => :destroy

  has_many   :statuses,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
