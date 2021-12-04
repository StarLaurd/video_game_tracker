class Publisher < ApplicationRecord
  # Direct associations

  has_many   :video_games,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
