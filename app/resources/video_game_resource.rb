class VideoGameResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :release_date, :date
  attribute :rating_id, :integer
  attribute :image, :string
  attribute :publisher_id, :integer
  attribute :developer_id, :integer

  # Direct associations

  belongs_to :rating

  belongs_to :developer

  belongs_to :publisher

  has_many   :notes,
             foreign_key: :game_id

  has_many   :statuses,
             foreign_key: :game_id

  has_many   :ratings,
             foreign_key: :game_id

  # Indirect associations
end
