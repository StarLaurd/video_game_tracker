class Platform < ApplicationRecord
  # Direct associations

  has_many   :ratings,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
