class NoteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :game_id, :integer
  attribute :note, :string

  # Direct associations

  belongs_to :user

  belongs_to :game,
             resource: VideoGameResource

  # Indirect associations
end
