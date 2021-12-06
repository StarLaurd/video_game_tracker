class Platform < ApplicationRecord
  enum name: { "pc" => 0, "xbox" => 1, "playstation" => 2, "nintendo_switch" => 3,
               "nintendo_wii" => 4, "xbox_360" => 5, "xbox_one" => 6, "xbox_series_x" => 7, "playstation_2" => 8, "playstation_3" => 9, "playstation_4" => 10, "playstation_5" => 11, "game_boy" => 12 }

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
