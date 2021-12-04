class RatingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :game_id, :integer
  attribute :user_id, :integer
  attribute :rating, :integer
  attribute :review, :string

  # Direct associations

  belongs_to :user

  belongs_to :game,
             resource: VideoGameResource

  # Indirect associations

end
