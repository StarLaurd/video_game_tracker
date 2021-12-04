class Note < ApplicationRecord
  # Direct associations

  belongs_to :game,
             :class_name => "VideoGame"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
