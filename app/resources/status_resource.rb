class StatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :game_id, :integer
  attribute :user_id, :integer
  attribute :status, :string_enum, allow: Status.statuses.keys

  # Direct associations

  belongs_to :user

  belongs_to :game,
             resource: VideoGameResource

  # Indirect associations

end
