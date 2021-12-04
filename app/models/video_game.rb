class VideoGame < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :rating

  belongs_to :developer

  belongs_to :publisher

  has_many   :notes,
             foreign_key: "game_id",
             dependent: :destroy

  has_many   :statuses,
             foreign_key: "game_id",
             dependent: :destroy

  has_many   :ratings,
             foreign_key: "game_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
