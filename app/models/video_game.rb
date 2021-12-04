class VideoGame < ApplicationRecord
  # Direct associations

  has_many   :ratings,
             :foreign_key => "game_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
