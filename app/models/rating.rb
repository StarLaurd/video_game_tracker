class Rating < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :game,
             :class_name => "VideoGame"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    game.to_s
  end

end
