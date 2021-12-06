class PlatformResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string_enum, allow: Platform.names.keys

  # Direct associations

  has_many :ratings

  # Indirect associations
end
